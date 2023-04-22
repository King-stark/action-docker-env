# X-UI
> 参考： [`enwaiax/x-ui`](https://hub.docker.com/r/enwaiax/x-ui)

| 版本 |
|:-----|
|[vaxilu/x-ui](https://github.com/vaxilu/x-ui)|
|[FranzKafkaYu/x-ui](https://github.com/FranzKafkaYu/x-ui)|
|[X-UI-Unofficial/x-ui](https://github.com/X-UI-Unofficial)|

* 建立容器
```
mkdir x-ui && cd x-ui
docker run -itd --network=host \
    -v $PWD/db/:/etc/x-ui/ \
    -v $PWD/cert/:/root/cert/ \
    --name x-ui --restart=unless-stopped \
    enwaiax/x-ui
```

* 使用 docker-compose.yml
```
version: '3.9'
services:
  xui:
    image: enwaiax/x-ui
    container_name: x-ui
    hostname: x-ui
    restart: unless-stopped
    network_mode: host
    volumes:
      - /home/ubuntu/x-ui/db/:/etc/x-ui/
      - /home/ubuntu/x-ui/cert/:/root/cert/

  npm:
    image: 'jc21/nginx-proxy-manager:2.9.22'
    container_name: npm
    hostname: npm
    restart: unless-stopped
    network_mode: host
    #ports:
      # Public HTTP Port:
      #- '80:80'
      # Public HTTPS Port:
      #- '443:443'
      # Admin Web Port:
      #- '81:81'
    environment:
      # These are the settings to access your db
      #DB_MYSQL_HOST: "db"
      #DB_MYSQL_PORT: 3306
      #DB_MYSQL_USER: "npm"
      # DB_MYSQL_PASSWORD: "npm"  # use secret instead
      #DB_MYSQL_PASSWORD__FILE: /run/secrets/MYSQL_PWD
      #DB_MYSQL_NAME: "npm"
      # If you would rather use Sqlite uncomment this
      # and remove all DB_MYSQL_* lines above
      DB_SQLITE_FILE: "/data/database.sqlite"
      # Uncomment this if IPv6 is not enabled on your host
      DISABLE_IPV6: 'true'
    volumes:
      - /home/ubuntu/x-ui/npm/data:/data
      - /home/ubuntu/x-ui/npm/letsencrypt:/etc/letsencrypt
```
