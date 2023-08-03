FROM debian:12-slim
LABEL maintainer t.me/King_Stark_bot

ENV TZ=Asia/Shanghai \
    LANG=C.UTF-8

WORKDIR /root
ARG DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ca-certificates wget \
    && arch=$(dpkg --print-architecture);wget -qO sillyGirl https://github.com/cdle/sillyGirl/releases/download/main/sillyGirl_linux_${arch} \
    && chmod 777 sillyGirl

# VOLUME [ "/etc/sillyplus" ]
ENTRYPOINT ["./sillyGirl", "-t"]
