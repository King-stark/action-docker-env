FROM ubuntu
RUN echo '开始构建..................'
MAINTAINER t.me/King_Stark_bot
# LABEL maintainer t.me/King_Stark_bot

RUN apt-get update && apt-get install -y --no-install-recommends -y ca-certificates wget nano \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root

RUN wget -O gz_client_bot.tar.gz  https://github.com/semicons/java_oci_manage/releases/latest/download/gz_client_bot.tar.gz \
    && tar -zxvf gz_client_bot.tar.gz --exclude=client_config && tar -zxvf gz_client_bot.tar.gz --skip-old-files client_config \
    && chmod +x sh_client_bot.sh \
#    && bash sh_client_bot.sh

ENTRYPOINT ["bash", "sh_client_bot.sh"]
CMD ["9527"]
RUN echo '构建完成..................'