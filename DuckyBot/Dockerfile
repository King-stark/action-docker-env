FROM ubuntu

# RUN echo '开始构建..................'

# 镜像维护者信息
MAINTAINER t.me/King_Stark_bot
# 标签
# LABEL maintainer t.me/King_Stark_bot

# 环境变量，仅Dockerfile内构建时调用
# 非交互式，命令执行过程中无需确认，以默认的选项快速完成执行，请确保只在Dockerfile构建中调用
ARG DEBIAN_FRONTEND=noninteractive

# 环境变量，不仅作用于构建时，容器内依然有效
ENV TZ=Asia/Shanghai \
    LANG=C.UTF-8

#    LANG=en_US.utf8

# RUN apt-get -y update && apt-get install -y wget curl \
RUN bash <(wget -qO- https://raw.githubusercontent.com/DuckyProject/DuckyRoBot/main/Install.sh)

# 创建切换工作目录（必须现存或者提前创建）
# RUN mkdir -p /data/ducky_bot
WORKDIR /data/ducky_bot

#
# ENTRYPOINT ["bash", "sh_client_bot.sh"]
CMD ["/data/ducky_bot/client"]
# RUN echo '构建完成..................'
