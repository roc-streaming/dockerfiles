FROM debian:stable

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# native compilers
RUN apt-get install -y g++

# tools
RUN apt-get install -y \
    scons \
    gengetopt \
    wget \
    xz-utils \
    qemu-user

# roc dependencies
RUN apt-get install -y \
    libtool \
    intltool \
    autoconf \
    automake \
    automake-1.15 \
    pkg-config \
    make \
    cmake

# toolchain
RUN TOOLCHAIN="arm-linux-gnueabihf"; \
    RELEASE="4.9-2016.02"; \
    ARCH="x86_64"; \
    ARCHIVE="gcc-linaro-${RELEASE}-${ARCH}_${TOOLCHAIN}"; \
    MIRROR="http://releases.linaro.org/components/toolchain/binaries"; \
    wget -O - "${MIRROR}/${RELEASE}/${TOOLCHAIN}/${ARCHIVE}.tar.xz" | \
    tar -C /opt -xJf - && \
    mv /opt/${ARCHIVE} /opt/toolchain && \
    cp -a /opt/toolchain/${TOOLCHAIN}/libc/lib/* /opt/toolchain/${TOOLCHAIN}/lib

# sysroot
RUN ln -s /opt/toolchain/arm-linux-gnueabihf /opt/sysroot

# path
ENV PATH="/opt/toolchain/bin:${PATH}"
