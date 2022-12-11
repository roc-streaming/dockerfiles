FROM debian:stable

ARG COMMIT

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN apt-get update

# toolchain dependencies
RUN apt-get install -y \
    libgcc1:i386 \
    libstdc++6:i386 \
    zlib1g:i386

# native compilers
RUN apt-get install -y \
    g++

# tools
RUN apt-get install -y \
    gengetopt \
    qemu-user \
    ragel \
    scons \
    unzip \
    wget

# roc dependencies
RUN apt-get install -y \
    autoconf \
    automake \
    automake1.11 \
    cmake \
    intltool \
    libtool \
    make \
    pkg-config

# extras
RUN apt-get install -y \
    git

# toolchain
RUN wget -O /tmp/tools.zip \
    https://codeload.github.com/raspberrypi/tools/zip/${COMMIT} && \
    unzip /tmp/tools.zip -d /tmp && \
    mv /tmp/tools-${COMMIT}/arm-bcm2708/arm-bcm2708hardfp-linux-gnueabi /opt/toolchain && \
    rm -rf /tmp/tools-${COMMIT} && \
    rm /tmp/tools.zip

# sysroot
RUN ln -s /opt/toolchain/arm-bcm2708hardfp-linux-gnueabi /opt/sysroot

# path
ENV PATH="/opt/toolchain/bin:${PATH}"
