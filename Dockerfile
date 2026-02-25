FROM ubuntu:20.04
LABEL maintainer="paldier <paldier@hotmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV TOOLCHAIN_BASE /opt/toolchains
ENV LANG C.UTF-8
ENV TERM xterm-256color


WORKDIR /build

RUN \
    # Install latest packages
    apt-get -y dist-upgrade && \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get -y --no-install-recommends \
      install build-essential asciidoc dos2unix libtool-bin cmake libproxy-dev   \
      uuid-dev liblzo2-dev autoconf automake bash bison bzip2 diffutils  \
      file flex m4 g++ gawk groff-base libncurses5-dev libtool libslang2 \
      make patch perl pkg-config shtool subversion tar texinfo zlib1g    \
      zlib1g-dev git gettext libexpat1-dev libssl-dev cvs gperf unzip    \
      python2.7 libxml-parser-perl gcc-multilib libxml2-dev g++-multilib   \
      gitk libncurses5 mtd-utils libvorbis-dev autopoint autogen sed     \
      intltool libglib2.0-dev xutils-dev                 \
      lib32z1-dev lib32stdc++6 xsltproc gtk-doc-tools libelf-dev:i386    \
      libelf1:i386 libltdl-dev openssh-server curl nano lzip patchelf    \
      automake gosu bc rsync sudo xxd binutils libz-dev patch python3.5 \
      lib32gcc1 libc6-dev-i386 uglifyjs git-core p7zip p7zip-full msmtp \
      xmlto qemu-utils upx device-tree-compiler antlr3 wget lib32z1  \
      binutils-dev lzma liblzma-dev lzma-dev libstdc++5 docbook-xsl-*   \
      sharutils gengetopt && \

    # Clean up env
    apt -y autoremove && \
    apt -y autoclean && \
    rm -Rf /var/cache/apt/archives/* && \

    # Set bash as default shell
    sudo ln -sf /bin/bash /bin/sh && \

    # Set "docker" as root password
    echo "root:docker" | chpasswd && \

    # Adds docker user
    useradd -m docker && \
    echo "docker:docker" | chpasswd && adduser docker sudo && \
    echo "docker ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/docker && \

    # Sets up toolchains
    gosu docker bash -c 'cd ~ && git clone https://github.com/SWRT-dev/mtk-toolchains && git clone https://github.com/SWRT-dev/qca-toolchains && git clone https://github.com/SWRT-dev/bcmhnd-toolchains && git clone https://github.com/SWRT-dev/bcm-toolchains'


COPY envs /home/docker/envs
RUN chown docker /home/docker/envs/* && \
    chmod 755    /home/docker/envs/*

RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' \
    >> /etc/bash.bashrc \
    ; echo "This Docker image would allow you to build SWRT firmware." > /etc/motd \
    ; echo "To initialize correctly the env, please run" >> /etc/motd \
    ; echo " 'source /home/docker/envs/toolchain.sh'" >> /etc/motd \
    ; echo " 'source /home/docker/envs/bcm.sh'" >> /etc/motd

# Set docker as default
USER docker:docker

CMD ["bash"]
