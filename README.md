# Генератор конфигов Cloudflare WARP для AmneziaWG и Clash
Не стоит выполнять скрипты локально, так как РКН заблокировал запросы для получения конфигурации. Вместо этого лучше запускать их на удалённых серверах. Ниже приведены несколько подходящих сервисов, которые предоставляют бесплатные временные серверы.
## 1. WARP для AmneziaWG
### Вариант 1: Killercoda
1. Перейдите на https://killercoda.com/playgrounds/scenario/ubuntu
2. Войдите через Google
3. Когда процесс входа закончится, отобразится терминал. Вставьте команду (Shift + Insert):
```bash
bash <(wget --inet4-only -qO- https://raw.githubusercontent.com/ImMALWARE/bash-warp-generator/main/warp_generator.sh)
```
4. После того как конфиг сгенерируется, скопируйте его и вставьте в новый текстовый файл. Либо, чтобы скачать его файлом, выделите ссылку и нажмите Ctrl + C, затем вставьте её в адресную строку браузера. Импортируйте файл в [AmneziaWG](https://wiki.malw.link/network/vpns/amneziawg) или [AmneziaVPN](https://wiki.malw.link/network/vpns/amneziavpn).

### Вариант 2: Replit
1. Зайдите сюда: [![Run on Repl.it](https://repl.it/badge/github/replit/upm)](https://replit.com/new/github/ImMALWARE/bash-warp-generator)
2. Войдите или создайте аккаунт.
3. В центральной панели с вкладками откройте новую вкладку и выберите Console.
4. Нажмите кнопку **▶️Project** (может называться **▶️Run .replit run command**)
5. Введите в терминале 1 для генерации конфига AmneziaWG и нажмите Enter.
6. После того как конфиг сгенерируется, он будет сохранён в `warp.conf`. В правом меню нажмите "File Tree", затем нажмите правой кнопкой мыши на `warp.conf` и выберите Download.
Также вы можете скопировать конфиг из терминала и вставить его в новый текстовый файл. Либо, чтобы скачать его файлом, выделите ссылку и нажмите Ctrl + Shift + C, затем вставьте её в адресную строку браузера. Импортируйте файл в [AmneziaWG](https://wiki.malw.link/network/vpns/amneziawg) или [AmneziaVPN](https://wiki.malw.link/network/vpns/amneziavpn).

### Вариант 3: GitHub Codespaces
1. Перейдите по ссылке: https://github.com/ImMALWARE/bash-warp-generator/codespaces
2. Войдите в GitHub.
3. Нажмите **`Create codespace on main`**
4. Дождитесь, пока среда загрузится. Это может занять 10-30 секунд.
5. Если внизу экрана не появился терминал, нажмите в верхнем меню Терминал -> Создать терминал. Затем вставьте в терминал команду (Shift + Insert):
```bash
bash warp_generator.sh
```
6. После того как конфиг сгенерируется, он будет сохранён в `warp.conf`. В левом меню с файлами нажмите правой кнопкой мыши на `warp.conf` и выберите "Скачивание".
Также вы можете скопировать конфиг из терминала и вставить его в новый текстовый файл. Либо, чтобы скачать его файлом, выделите ссылку и нажмите Ctrl + Shift + C, затем вставьте её в адресную строку браузера. Импортируйте файл в [AmneziaWG](https://wiki.malw.link/network/vpns/amneziawg) или [AmneziaVPN](https://wiki.malw.link/network/vpns/amneziavpn).

## 2. WARP MASQUE для Clash
### Вариант 1: Killercoda
1. Перейдите на https://killercoda.com/playgrounds/scenario/ubuntu
2. Войдите через Google
3. Когда процесс входа закончится, отобразится терминал. Вставьте команду (Shift + Insert):
```bash
bash <(wget --inet4-only -qO- https://raw.githubusercontent.com/ImMALWARE/bash-warp-generator/main/masque_generator.sh)
```
4. После того как конфиг сгенерируется, скопируйте его и вставьте в новый текстовый файл. Либо, чтобы скачать его файлом, выделите ссылку и нажмите Ctrl + C, затем вставьте её в адресную строку браузера. О подключении рассказано ниже.

### Вариант 2: Replit
1. Зайдите сюда: [![Run on Repl.it](https://repl.it/badge/github/replit/upm)](https://replit.com/new/github/ImMALWARE/bash-warp-generator)
2. Войдите или создайте аккаунт.
3. В правой панели с вкладками откройте новую вкладку и выберите Console.
4. Нажмите кнопку **▶️Project** (может называться **▶️Run .replit run command**)
5. Введите в терминале 2 для генерации конфига MASQUE и нажмите Enter.
6. После того как конфиг сгенерируется, он будет сохранён в `warp-masque-clash.yaml`. В правом меню нажмите "File Tree", затем нажмите правой кнопкой мыши на `warp-masque-clash.yaml` и выберите Download.
Также вы можете скопировать конфиг из терминала и вставить его в новый текстовый файл. Либо, чтобы скачать его файлом, выделите ссылку и нажмите Ctrl + Shift + C, затем вставьте её в адресную строку браузера. О подключении рассказано ниже.

### Вариант 3: GitHub Codespaces
1. Перейдите по ссылке: https://github.com/ImMALWARE/bash-warp-generator/codespaces
2. Войдите в GitHub.
3. Нажмите **`Create codespace on main`**
4. Дождитесь, пока среда загрузится. Это может занять 10-30 секунд.
5. Если внизу экрана не появился терминал, нажмите в верхнем меню Терминал -> Создать терминал. Затем вставьте в терминал команду (Shift + Insert):
```bash
bash masque_generator.sh
```
6. После того как конфиг сгенерируется, он будет сохранён в `warp-masque-clash.yaml`. В левом меню с файлами нажмите правой кнопкой мыши на `warp-masque-clash.yaml` и выберите "Скачивание".
Также вы можете скопировать конфиг из терминала и вставить его в новый текстовый файл. Либо, чтобы скачать его файлом, выделите ссылку и нажмите Ctrl + Shift + C, затем вставьте её в адресную строку браузера. О подключении рассказано ниже.

## Подключение к WARP по протоколу MASQUE
### Clash Verge Rev для Windows, macOS, Linux

1. Установите Clash Verge Rev.

Windows: https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v2.5.2/Clash.Verge_2.5.2_x64-setup.exe

macOS ARM: https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v2.5.2/Clash.Verge_2.5.2_aarch64.dmg

macOS Intel: https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v2.5.2/Clash.Verge_2.5.2_x64.dmg

Linux deb: https://github.com/clash-verge-rev/clash-verge-rev/releases/download/v2.5.2/Clash.Verge_2.5.2_amd64.deb

AUR: `clash-verge-bin`

2. Перейдите в левый раздел "Профили".
3. Нажмите "НОВЫЙ". Установите Тип: Local. Нажмите "ВЫБРАТЬ ФАЙЛ" и выберите скачанный конфиг `warp-masque-clash.yaml`. Нажмите "СОХРАНИТЬ".
<img src="https://wiki.malw.link/img/network/vpns/warp/clash-verge-create-profile.png" class="center" width="600px">
4. Нажмите правой кнопкой мыши на появившийся профиль и выберите "Выбрать".
5. Перейдите в левый раздел "Прокси".
6. Нажмите на блок "PROXY". Должен появиться WARP-Masque. Нажмите Check в его правой части.
<img src="https://wiki.malw.link/img/network/vpns/warp/clash-verge-check.png" class="center" width="600px">

Если после этого на месте Check отобразилось число, это значение пинга. Значит, подключение к WARP успешно. Перейдите в левый раздел "Главная", в настройках сети выберите "Режим TUN" и включите его. Таким образом, весь трафик устройства будет идти через WARP.

Если же отобразилось "Timeout", значит, подключение к WARP не удалось. Но лучше попробовать проверить несколько раз: не всегда срабатывает с первого раза.
### FlClash для Android
1. Скачайте и установите APK FlClash: https://github.com/chen08209/FlClash/releases/download/v0.8.94/FlClash-0.8.94-android-arm64-v8a.apk
2. Перейдите в раздел Профили. Нажмите "Добавить профиль" -> Файл -> Выберите файл конфига.
3. Перейдите в раздел "Прокси". Нажмите "Тест задержки". Если отобразилось число, это значение пинга. Значит, подключение к WARP успешно. Перейдите в раздел "Панель управления" и включите VPN, нажав кнопку ▶️.

Если отобразилось "Timeout", значит, подключение к WARP не удалось. Но лучше попробовать проверить несколько раз: не всегда срабатывает с первого раза.
### Clash Mi для iOS
1. Установите Clash Mi: https://apps.apple.com/us/app/clash-mi/id6744321968?l=ru
2. Выберите пункт "Профили" -> кнопка + сверху -> "Импорт файла конфигурации". Выберите скачанный конфиг `warp-masque-clash.yaml`.
3. Выберите добавленный конфиг в списке профилей.
4. Включите VPN на главном экране верхним переключателем.
5. Проверьте работу открытием какого-нибудь сайта, например, https://ipinfo.io/what-is-my-ip.

# Частые ошибки в приложениях AmneziaWG

## Две запятые подряд: ","

По какой-то причине конфиг сгенерировался неверно. Удалите его, попробуйте сгенерировать заново другим способом или скачайте уже рабочий.

## Название туннеля недействительно: "WARP (1)"

Переименуйте файл .conf: в его имени не должно быть пробелов и скобок.

## Неверный ключ для секции [Interface]: "s1"

Импортировать конфиг WARP нужно не в WireGuard, а в AmneziaWG или AmneziaVPN!

## Неправильное имя

В мобильном приложении AmneziaWG название конфига должно быть не длиннее 15 символов.

## Включить обфускацию WireGuard

Если в конфиге отсутствуют значения S1 и S2, AmneziaVPN не даст подключиться к нему и предложит включить обфускацию. Приложение AmneziaWG умеет читать такие сломанные конфиги, но использовать их всё равно не рекомендуется.

## Unable to create Wintun interface

### Решение 1: Удаление записи в реестре
1.  Откройте "Редактор реестра" в Windows. Его можно найти в поиске, либо [выполнить команду](https://wiki.malw.link/windows/run) `regedit`.
2.  Перейдите в **HKEY_CLASSES_ROOT** -> **CLSID**. Найдите и удалите раздел `{3d09c1ca-2bcc-40b7-b9bb-3f3ec143a87b}`.
3.  Перезапустите приложение AmneziaWG.

### Решение 2: Переустановка AmneziaWG от имени администратора:

1.  Удалите AmneziaWG в "Программах и компонентах".
2.  Скопируйте полный путь к .msi файлу установщика AmneziaWG. Для этого, **удерживая Shift**, нажмите правой кнопкой мыши по нему -> Копировать как путь.
3.  Откройте [Командную строку от имени администратора](https://wiki.malw.link/windows/run).
4.  Вставьте в командную строку скопированный путь, нажав по ней правой кнопкой мыши, и нажмите Enter.

Таким образом, MSI-файл будет открыт от имени администратора. Возможно, это решит проблему.

### Решение 3: Удаление драйвера wintun:

1.  Удалите AmneziaWG в "Программах и компонентах".
2.  Откройте [Командную строку от имени администратора](https://wiki.malw.link/windows/run).
3.  Выполните команды:
    ```bat
    dism /online /get-drivers /format:table > drivers.txt
    notepad drivers.txt
    ```
4.  Найдите `wintun.inf`. Нужен соответствующий ему oem-номер. В моём случае это `oem7.inf`:
    <img src="https://wiki.malw.link/img/network/vpns/amneziawg/wintun-inf.png">
5.  Выполните команду для его удаления:
    ```bat
    pnputil.exe /d oem7.inf
    ```
    Вместо 7 подставьте номер, который соответствует wintun.inf в вашем блокноте!
6.  Скопируйте полный путь к .msi файлу установщика AmneziaWG. Для этого, **удерживая Shift**, нажмите правой кнопкой мыши по нему -> Копировать как путь.
7.  Вставьте в командную строку скопированный путь, просто нажав по ней правой кнопкой мыши, нажмите Enter. Установите AmneziaWG.

### Решение 4: AmneziaVPN вместо AmneziaWG

Приложение [AmneziaVPN](https://wiki.malw.link/network/vpns/amneziavpn) полностью поддерживает конфиги протокола AmneziaWG.

## Не работают соединения к локальной сети

Откройте конфигурационный файл для редактирования:

<img src="https://wiki.malw.link/img/network/vpns/amneziawg/edit-tunnel.png"/>

Снимите галочку "Блокировать нетуннелированный трафик".

## Failed to set IPv4: error: Destination address required на macOS

Удалите [IPv6-адрес](https://ru.wikipedia.org/wiki/IPv6) из файла конфигурации.

# Что-то не получается?

Напишите в чат: https://t.me/immalware_chat
