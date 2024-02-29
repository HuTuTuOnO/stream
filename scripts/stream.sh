#!/usr/bin/env bash
echo=echo
for cmd in echo /bin/echo; do
    $cmd >/dev/null 2>&1 || continue

    if ! $cmd -e "" | grep -qE '^-e'; then
        echo=$cmd
        break
    fi
done

CSI=$($echo -e "\033[")
CEND="${CSI}0m"
CDGREEN="${CSI}32m"
CRED="${CSI}1;31m"
CGREEN="${CSI}1;32m"
CYELLOW="${CSI}1;33m"
CBLUE="${CSI}1;34m"
CMAGENTA="${CSI}1;35m"
CCYAN="${CSI}1;36m"

OUT_ALERT() {
    echo -e "${CYELLOW}$1${CEND}"
}

OUT_ERROR() {
    echo -e "${CRED}$1${CEND}"

    exit $?
}

OUT_INFO() {
    echo -e "${CCYAN}$1${CEND}"
}

if [[ -f /etc/redhat-release ]]; then
    release="centos"
elif cat /etc/issue | grep -q -E -i "debian"; then
    release="debian"
elif cat /etc/issue | grep -q -E -i "ubuntu"; then
    release="ubuntu"
elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
    release="centos"
elif cat /proc/version | grep -q -E -i "raspbian|debian"; then
    release="debian"
elif cat /proc/version | grep -q -E -i "ubuntu"; then
    release="ubuntu"
elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
    release="centos"
else
    OUT_ERROR "[错误] 不支持的操作系统！"
fi

if [[ x"${release}" == x"centos" ]]; then
    yum install epel-release -y
    yum install wget curl unzip zip -y
else
    apt update -y
    apt install wget curl unzip zip -y
fi

cd ~

CURRENT=$(curl -fsSL -4 https://www.cloudflare.com/cdn-cgi/trace | grep ip | tr -d 'ip=')
if [[ "$CURRENT" == "" ]]; then
    exit 1
fi

OUT_ALERT "[提示] 更新 Stream 中"
wget -O /etc/smartdns/stream.conf            https://raw.githubusercontent.com/HuTuTuOnO/stream/master/smartdns/stream.conf      || exit $?
sed -i "s/1.1.1.1/$CURRENT/" /etc/smartdns/stream.conf

OUT_ALERT "[提示] 重载服务中"
systemctl restart stream
systemctl restart smartdns

OUT_INFO  "[信息] 部署完毕！"
exit 0
