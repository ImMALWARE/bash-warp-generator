# Сгенерируйте конфиг Cloudflare WARP для AmneziaVPN
Этот bash скрипт сгенерирует конфиг Cloudflare WARP для AmneziaVPN.

Не стоит выполнять его локально, так как РКН заблокировал запросы для получения конфига. Вместо этого лучше выполнять на удалённых серверах.

## Вариант 1: Aeza Terminator
1. Заходим на https://terminator.aeza.net
2. Выбираем **`debian`**
3. Вставляем команду:
```bash
bash <(wget --inet4-only -qO- https://raw.githubusercontent.com/ImMALWARE/bash-warp-generator/main/warp_generator.sh)
```
4. После того, как конфиг сгенерируется, копируем его, либо скачиваем файлом по ссылке и импортируем в AmneziaVPN!👍

## Вариант 2: pad.ws
1. Заходим на https://pad.ws
2. Continue with Google
3. В окне Dashboard, если будет кнопка Start, нажмите на неё
4. Terminal
5. Вставляем команду:
```bash
bash <(wget --inet4-only -qO- https://raw.githubusercontent.com/ImMALWARE/bash-warp-generator/main/warp_generator.sh)
```
6. После того, как конфиг сгенерируется, копируем его, либо скачиваем файлом по ссылке и импортируем в AmneziaVPN!👍

## Вариант 3: Replit
1. Тыкаем сюда: [![Run on Repl.it](https://repl.it/badge/github/replit/upm)](https://replit.com/new/github/ImMALWARE/bash-warp-generator)
2. Создаём аккаунт
3. Нажимаем кнопку **`Run`** вверху
4. После того, как конфиг сгенерируется, копируем его, либо скачиваем файлом по ссылке и импортируем в AmneziaVPN!👍

## Вариант 4: GitHub Codespaces
1. Переходим по ссылке: https://github.com/ImMALWARE/bash-warp-generator/codespaces
2. Вводим учётные данные GitHub (потребуется авторизация, если вы не вошли в аккаунт)
3. Нажимаем **`Create codespace on main`**
4. Дожидаемся, пока среда загрузится (может занять 10–30 секунд)
5. В терминале (внизу экрана) вводим команду:
```bash
bash warp_generator.sh
```
6. После того, как конфиг сгенерируется, копируем его, либо скачиваем файлом по ссылке и импортируем в AmneziaVPN!👍
7. После завершения можно **удалить codespace**:  
   - Переходим в https://github.com/ImMALWARE/bash-warp-generator/codespaces
   - Нажимаем на три точки → **Delete**  
   *GitHub удаляет Codespaces автоматически через некоторое время бездействия, но лучше удалить сразу.*

## Что-то не получается?
Напишите в чат: https://t.me/immalware_chat
