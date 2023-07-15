FROM debian:11-slim
LABEL maintainer t.me/King_Stark_bot

ENV TZ=Asia/Shanghai \
    LANG=C.UTF-8

ARG DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates wget \
    && arch=$(dpkg --print-architecture);wget -qO sillyGirl https://github.com/cdle/sillyGirl/releases/download/main/sillyGirl_linux_${arch}
    && chmod 777 ./sillyGirl
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME [ "/etc/sillyplus" ]
ENTRYPOINT ["./sillyGirl" "-t"]
