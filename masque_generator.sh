#!/bin/bash

clear
if [ -d "/home/runner" ] || [ ! -z "$REPL_ID" ]; then
    echo "[INFO] Запуск в Replit — пропускаем установку системных пакетов"
else
    mkdir -p ~/.cloudshell && touch ~/.cloudshell/no-apt-get-warning
    apt update -y && apt install sudo -y
    sudo apt-get update -y --fix-missing && sudo apt-get install curl jq openssl -y --fix-missing
fi

KEY=$(mktemp)
openssl ecparam -name prime256v1 -genkey -noout -out "$KEY" 2>/dev/null
PRIV_B64=$(openssl ec -in "$KEY" -outform DER 2>/dev/null | base64 -w 0)
PUB_B64=$(openssl ec -in "$KEY" -pubout -outform DER 2>/dev/null | base64 -w 0)
rm -f "$KEY"

ins() {
    curl -s -H "User-Agent: WARP for Android" \
            -H "CF-Client-Version: a-6.35-4471" \
            -H "Content-Type: application/json; charset=UTF-8" \
            -X "$1" "https://api.cloudflareclient.com/v0a4471/$2" "${@:3}"
}
sec() {
    ins "$1" "$2" -H "Authorization: Bearer $3" "${@:4}"
}

WG_KEY=$(openssl rand -base64 32 | tr -d '\n')
SERIAL=$(openssl rand -hex 8)

REG_DATA=$(jq -n \
    --arg tos "$(date -u +%FT%TZ)" \
    --arg key "$WG_KEY" \
    --arg serial "$SERIAL" '{
    key: $key,
    key_type: "curve25519",
    tunnel_type: "wireguard",
    fcm_token: "",
    install_id: "",
    locale: "en_US",
    model: "PC",
    os_version: "",
    serial_number: $serial,
    tos: $tos
}')

REG_RESP=$(ins POST "reg" -d "$REG_DATA")

ID=$(echo "$REG_RESP" | jq -r '.result.id // .id // empty')
TOKEN=$(echo "$REG_RESP" | jq -r '.result.token // .token // empty')

if [ -z "$ID" ] || [ "$ID" = "null" ] || [ -z "$TOKEN" ]; then
  echo "[ERROR] Ошибка регистрации аккаунта!"
  echo "$REG_RESP" | jq .
  exit 1
fi

echo "[INFO] Аккаунт создан. ID: $ID"

ENROLL_DATA=$(jq -n --arg pub "$PUB_B64" '{
    key: $pub,
    key_type: "secp256r1",
    tunnel_type: "masque"
}')

PATCH_RESP=$(sec PATCH "reg/${ID}" "$TOKEN" -d "$ENROLL_DATA")

if [ -z "$PATCH_RESP" ]; then
  echo "[ERROR] Пустой ответ от API при enrollment!"
  exit 1
fi

API_ERR=$(echo "$PATCH_RESP" | jq -r '.success // true')
if [ "$API_ERR" = "false" ]; then
  echo "[ERROR] Ошибка enrollment от API!"
  echo "$PATCH_RESP" | jq .
  exit 1
fi

PEER_PUB_RAW=$(echo "$PATCH_RESP" | jq -r '.result.config.peers[0].public_key // .config.peers[0].public_key // empty')
PEER_PUB=$(echo "$PEER_PUB_RAW" | sed 's/\r//g; /-----BEGIN PUBLIC KEY-----/d; /-----END PUBLIC KEY-----/d' | tr -d '[:space:]')
CLIENT_IPV4=$(echo "$PATCH_RESP" | jq -r '.result.config.interface.addresses.v4 // .config.interface.addresses.v4 // empty')
CLIENT_IPV6=$(echo "$PATCH_RESP" | jq -r '.result.config.interface.addresses.v6 // .config.interface.addresses.v6 // empty')

SERVER_IP_RAW=$(echo "$PATCH_RESP" | jq -r '.result.config.peers[0].endpoint.v4 // .config.peers[0].endpoint.v4 // empty')

SERVER_IP=$(echo "$SERVER_IP_RAW" | sed 's/:[0-9]*$//')

if [ -z "$SERVER_IP" ] || [ "$SERVER_IP" = "null" ]; then
  SERVER_IP="162.159.192.1"
fi

if [ -z "$PEER_PUB" ] || [ "$PEER_PUB" = "null" ]; then
    echo "[ERROR] Ошибка получения конфигурации Cloudflare!"
    echo "$PATCH_RESP" | jq .
  exit 1
fi

conf=$(cat <<-EOM
port: 7890
socks-port: 7891
mixed-port: 7892
allow-lan: true
mode: rule
log-level: error
ipv6: true

dns:
  enable: true
  listen: 0.0.0.0:1053
  ipv6: true
  enhanced-mode: fake-ip
  fake-ip-range: 198.18.0.1/16
  nameserver:
    - 8.8.8.8
    - 1.1.1.1

proxies:
  - name: "WARP-Masque"
    type: masque
    server: ${SERVER_IP}
    port: 443
    private-key: "${PRIV_B64}"
    public-key: "${PEER_PUB}"
    ip: ${CLIENT_IPV4}
    ipv6: ${CLIENT_IPV6}
    mtu: 1280
    udp: true
    sni: consumer-masque.cloudflareclient.com
    skip-cert-verify: false
    network: h3
    remote-dns-resolve: true
    dns: [ 1.1.1.1, 8.8.8.8 ]

proxy-groups:
  - name: "PROXY"
    type: select
    proxies:
      - "WARP-Masque"

rules:
  - IP-CIDR,192.168.0.0/16,DIRECT
  - IP-CIDR,10.0.0.0/8,DIRECT
  - IP-CIDR,172.16.0.0/12,DIRECT
  - IP-CIDR,127.0.0.0/8,DIRECT
  - MATCH,PROXY
EOM
)

clear
echo -e "\n\n########## НАЧАЛО КОНФИГА MIHOMO ##########"
echo "${conf}"
echo "########### КОНЕЦ КОНФИГА MIHOMO ###########"
echo -e "\n"

conf_base64=$(echo -n "${conf}" | base64 -w 0)
echo "Скачать конфиг файлом: https://immalware.vercel.app/download?filename=warp-masque-clash.yaml&content=${conf_base64}"
echo -e "\n"
echo "Подробный гайд тут: https://wiki.malw.link/network/vpns/warp"
echo "Что-то не получилось? Есть вопросы? Пишите в чат: https://t.me/immalware_chat"
echo "${conf}" > warp-masque-clash.yaml

if [ "$CODESPACES" = "true" ]; then
    echo "[INFO] Обнаружен GitHub Codespaces. Конфиг сохранен в warp-masque-clash.yaml. В левом меню с файлами нажмите правой кнопкой на warp-masque-clash.yaml и выберите Скачивание."
fi

if [ -d "/home/runner" ] || [ ! -z "$REPL_ID" ]; then
    echo "[INFO] Обнаружен Replit. Конфиг сохранен в warp-masque-clash.yaml. В правом меню нажмите File Tree, нажмите правой кнопкой на warp-masque-clash.yaml и выберите Download."
fi