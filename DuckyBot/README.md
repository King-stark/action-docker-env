# [DuckyRoBot](https://github.com/DuckyProject/DuckyRoBot)
A Bot that integrates the next generation of practical tools.

## 机器人
https://t.me/DuckyRoBot

## 官方文档
https://docs.duckybot.me

## 官方频道
https://t.me/DuckyRoBotChannel

## 官方群组
https://t.me/DuckyGroup

# 使用方式
> ***1. 按照图片注释的`$1 $2 $3`写入客户端配置文件内***
![Install](https://github.com/King-stark/action-docker-env/raw/master/DuckyBot/img/Install.png)
> ***2. 参考下方甲骨文API信息获取说明写入密钥文件`key_file`，建议重命名为`地区.pem`放到当前目录下（同步更改docker部署命令中的密钥文件名）***
```
mkdir duckybot && cd duckybot
wget https://github.com/King-stark/action-docker-env/raw/master/DuckyBot/conf.ini
```

# 部署
```
docker run -dit \
    --name duckybot \
    --restart unless-stopped \
    -p 8088:8088 \
    -v $PWD/conf.ini:/data/ducky_bot/conf.ini \
    -v $PWD/us.pem:/data/ducky_bot/us.pem \
    clearloves/duckybot
```

## 甲骨文云API信息获取
```
【操作导航，任意一种均可】
- 1.甲骨文后台=>用户设置>>资源>>API秘钥>>添加API秘钥->(在指纹右侧三个点处查看参数)

- 2.如没有用户设置的请直接搜用户(切中文语言) 点击选择某个用户名 API秘钥>>添加API秘钥->(在指纹右侧三个点处查看参数)

- 3.不会搜的点击左边菜单一栏 找到身份和安全=>用户=>点击选择某个用户名=>API秘钥>>添加API秘钥）->(在指纹右侧三个点处查看参数)
- 说明∶此处配置是连接甲骨文云接口的所必须参数(还不会建议不玩脚本)
```text
大致如下↓

[DEFAULT]
user=ocid1.user.oc1..aaaaaaaaxxxxgwlg3xuzwgsaazxtzbozqq
fingerprint=b8:33:6f:xxxx:45:43:33
tenancy=ocid1.tenancy.oc1..aaaaaaaaxxx7x7h4ya
region=ap-singapore-1
key_file=/data/ducky_bot/singapore.pem
```
