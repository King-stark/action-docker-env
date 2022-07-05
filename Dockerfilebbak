# This file from https://github.com/EnnawYang/openwrt-build-env

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
ENV FORCE_UNSAFE_CONFIGURE 1

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends sudo zsh tree htop python3-dev libyaml-dev cmake gcc g++ make apt-utils hugo locales curl wget tzdata uuid-runtime \
    ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential bzip2 ccache cpio device-tree-compiler ecj fastjar flex gawk gettext gcc-multilib g++-multilib git git-core gperf haveged help2man intltool lib32gcc1 libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncurses5-dev libreadline-dev libssl-dev libtool libz-dev lrzsz mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip python3-ply python-docutils qemu-utils re2c rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim xmlto xxd zlib1g-dev gdisk rdate \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
    && apt-get autoremove --purge \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/.cache/*

ENV LANG en_US.utf8

RUN groupadd -g 1000 builder \
    && useradd -l -m -d /home/builder -u 1000 -g builder -G sudo -s /bin/bash builder \
    && echo '%builder ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER builder:builder
ENV HOME /home/builder
WORKDIR /home/builder

RUN CHSH=no RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" \
    && sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/' ~/.zshrc \
    && git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions \
    && git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
    && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && sed -i 's/plugins=(git)/plugins=(git extract sudo zsh-syntax-highlighting zsh-completions history-substring-search zsh-autosuggestions)\nautoload -U compinit \&\& compinit/g' ~/.zshrc
