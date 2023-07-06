# [R-Bot Docker](https://github.com/semicons/java_oci_manage.git)

## 启动
```
mkdir oci && cd oci

# 按照注释写入客户端配置文件 API密钥文件重命名为`oci.pem`放到当前目录下
wget https://github.com/King-stark/action-docker-env/raw/master/java-oci-manager/client_config

# docker 部署
docker run -d --name oci --restart unless-stopped -p 9527:9527 \
-v $PWD/client_config:/root/client_config -v $PWD/oci.pem:/root/oci.pem \
clearloves/java-oci-manager
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
key_file=oci.pem
```
