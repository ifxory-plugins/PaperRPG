# На момент создания сборки, ядро было версии 1.16.4
# ВНИМАНИЕ! Данный файл перекачивает ядро(получает абсолютно новый релиз)
# Решение самых распространённых проблем вы можете найти в README.md
# Это может занять какое то время.
# Гарантии полноценной работы сборки после запуска скрипта - нет!

# Проверить наличие пакета
installed() {
    return $(dpkg-query -W -f '${Status}\n' "${1}" 2>&1|awk '/ok installed/{print 0;exit}{print 1}')
}

if installed curl; then
    curl https://papermc.io/api/v1/paper/1.16.4/latest/download --output server/paper.jar
    echo 'Downloaded paper.jar using curl'
elif installed wget; then
    wget -O server/paper.jar https://papermc.io/api/v1/paper/1.16.4/latest/download
    echo 'Downloaded paper.jar using wget'
else
    echo 'Curl/wget is not installed!'
fi