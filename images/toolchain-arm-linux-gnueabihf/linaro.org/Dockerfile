FROM debian:stable

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y \
    autoconf \
    automake \
    automake1.11 \
    cmake \
    g++ \
    gengetopt \
    git \
    intltool \
    libtool \
    make \
    meson \
    pkg-config \
    qemu-user \
    ragel \
    scons \
    wget \
    xz-utils

ARG MAJOR
ARG MINOR
ARG DATE

# toolchain
RUN TOOLCHAIN="arm-linux-gnueabihf"; \
    ARCH="x86_64"; \
    ARCHIVE="gcc-linaro-${MAJOR}.${MINOR}-${DATE}-${ARCH}_${TOOLCHAIN}"; \
    MIRROR="https://releases.linaro.org/components/toolchain/binaries"; \
    wget -O - "${MIRROR}/${MAJOR}-${DATE}/${TOOLCHAIN}/${ARCHIVE}.tar.xz" | \
        tar -C /opt -xJf - && \
    mv /opt/${ARCHIVE} /opt/toolchain

# libc
RUN cp -a /opt/toolchain/arm-linux-gnueabihf/libc/lib/* \
    /opt/toolchain/arm-linux-gnueabihf/lib

# sysroot
RUN ln -s /opt/toolchain/arm-linux-gnueabihf /opt/sysroot

# path
ENV PATH="/opt/toolchain/bin:${PATH}"
