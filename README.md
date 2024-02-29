# Stream Unlock
[![](https://img.shields.io/badge/Telegram-Group-blue)](https://t.me/aioCloud)
[![](https://img.shields.io/badge/Telegram-Channel-green)](https://t.me/aioCloud_channel) 

流媒体解锁后端

## 推荐系统
- Debian 10
- Ubuntu 20.04
- CentOS 8 Stream


## 一键部署
```bash
部署
curl -fsSL https://raw.githubusercontent.com/HuTuTuOnO/stream/master/scripts/kickstart.sh | bash

升级
curl -fsSL https://raw.githubusercontent.com/HuTuTuOnO/stream/master/scripts/upgrade.sh | bash

卸载
curl -fsSL https://raw.githubusercontent.com/HuTuTuOnO/stream/master/scripts/remove.sh | bash
```
更新域名
curl -fsSL https://raw.githubusercontent.com/HuTuTuOnO/stream/master/scripts/stream.sh | bash
```

## 配置文件
Stream
```
/etc/stream.json
# 访问端口 "addr": ":8888",
# 访问秘钥 "secret": "HuTuTuOnO"

请自行增加解锁内容
twitter.com 全国
pscp.tv 全国
periscope.tv 全国
t.co 全国
twimg.co 全国
twimg.com 全国
twitpic.com 全国
twitter.jp 全国
vine.co 全国
syosetu.com 日本
rakuten.co.jp 日本
disney-plus.net 美国 新加坡
disneyplus.com 美国 新加坡
registerdisney.go.com 美国 新加坡
disneynow.com 美国 新加坡
dssott.com 美国 新加坡
bamgrid.com 美国 新加坡
go-mpulse.net 美国 新加坡
gstatic.com 美国 新加坡
googlevideo.com 全国
youtube.com 全国
ytimg.com 全国
googleapis.com 全国
yt3.ggpht.com 全国

更多列表https://raw.githubusercontent.com/HuTuTuOnO/stream@main/ruleset/allinone.list

```


## DDNSAPI
```
curl -fsSL http://DNSIP:8888/stream?secret=HuTuTuOnO
注意替换 IP 和端口，写入 crontab 即可

```

## 清空IP
```
curl -fsSL http://DNSIP:8888/purge?secret=HuTuTuOnO
注意替换 IP 和端口，写入 crontab 即可

```

## 控制命令
```
# 启动服务并开启自启
systemctl enable --now stream

# 停止服务并关闭自启
systemctl disable --now stream

# 查看启动服务状态
systemctl status stream

# 查看DNS服务状态
systemctl status smartdns

# 获取实时日志
journalctl -f -u stream

# 重启流媒体服务
systemctl restart stream

# 重启DNS服务
systemctl restart smartdns

```
