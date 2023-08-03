# [傻妞机器人](https://github.com/cdle/sillyGirl.git)
* ***[文档](https://cdle.github.io/sillyGirl)***

## docker安装
```
mkdir sillyGirl && cd sillyGirl

# 拉取并运行docker容器
docker run -itd \
-v $PWD/data:/etc/sillyplus \
-v $PWD/plugins:/usr/local/sillyplus/plugins \
-p 8080:8080 \
--name sillyGirl \
--restart always \
jackytj/sillyplus
```

## docker-compose安装
创建文件`docker-compose.yaml`并写入以下内容
```
version: '3'
services:
  sillyplus:
    image: dockerproxy.com/clearloves/sillygirl
    depends_on:  # 启动优先级
      - redis
    container_name: sillyplus
    hostname: sillyplus
    restart: unless-stopped
    # network_mode: host
    ports:
      - 8080:8080 # 如不使用默认8080web端口的话，推荐使用network_mode: host
    volumes:
      - ./data:/etc/sillyplus
      - ./plugins:/usr/local/sillyplus/plugins

# 可选高性能数据存储 redis 服务 （此处需要先创建redis配置文件）
  redis:
    image: dockerproxy.com/library/redis:alpine
    container_name: redis
    # hostname: redis
    restart: unless-stopped
    environment:
      - TZ=Asia/Shanghai
    ports:
      - 6379:6379 # 默认的redis服务端口
    volumes:
      # 如果不使用redis配置文件启动，暂时没找到传递数据持久化指令写入方式
      - ./redis/redis.conf:/etc/redis/redis.conf
      - ./redis:/data
    command: redis-server /etc/redis/redis.conf
    privileged: true
```
