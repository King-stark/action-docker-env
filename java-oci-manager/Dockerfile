FROM ubuntu

#RUN echo '开始构建..................'

# 镜像维护者信息
# MAINTAINER t.me/King_Stark_bot
# 标签
LABEL maintainer t.me/King_Stark_bot

# 环境变量，仅Dockerfile内构建时调用
# 非交互式，命令执行过程中无需确认，以默认的选项快速完成执行，请确保只在Dockerfile构建中调用
ARG DEBIAN_FRONTEND=noninteractive

# 切换工作目录（必须现存或者提前创建）
WORKDIR /root

RUN apt-get update && apt-get install -y --no-install-recommends -y ca-certificates wget openjdk-11-jdk \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && wget -O gz_client_bot.tar.gz  https://github.com/semicons/java_oci_manage/releases/latest/download/gz_client_bot.tar.gz \
    && tar -zxvf gz_client_bot.tar.gz && rm gz_client_bot.tar.gz && chmod +x sh_client_bot.sh
#    && bash sh_client_bot.sh

# 环境变量，不仅作用于构建时，容器内依然有效
ENV TZ=Asia/Shanghai \
    LANG=C.UTF-8

#
ENTRYPOINT ["bash", "sh_client_bot.sh"]
CMD ["9527"]
#RUN echo '构建完成..................'
