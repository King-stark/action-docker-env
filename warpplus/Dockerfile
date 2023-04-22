#基于的基础镜像
FROM python:3.8-buster
LABEL maintainer="support@cosr.eu.org"

# 设置/app文件夹是工作目录
WORKDIR /work

# 安装支持
RUN apt-get install git && \
    git clone https://github.com/Oreomeow/warpplus.git --depth=1 /work && \
    pip install python-telegram-bot && \
    chmod +x warpplus.py

ENTRYPOINT ["python", "warpplus.py"]
