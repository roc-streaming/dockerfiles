FROM debian:stable

ARG MAJOR
ARG MINOR
ARG DATE

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

# toolchain
RUN TOOLCHAIN="aarch64-linux-gnu"; \
    ARCH="x86_64"; \
    ARCHIVE="gcc-linaro-${MAJOR}.${MINOR}-${DATE}-${ARCH}_${TOOLCHAIN}"; \
    MIRROR="https://releases.linaro.org/components/toolchain/binaries"; \
    wget -O - "${MIRROR}/${MAJOR}-${DATE}/${TOOLCHAIN}/${ARCHIVE}.tar.xz" | \
        tar -C /opt -xJf - && \
    mv /opt/${ARCHIVE} /opt/toolchain && \
    cp -a /opt/toolchain/${TOOLCHAIN}/libc/lib/* /opt/toolchain/${TOOLCHAIN}/lib

# sysroot
RUN ln -s /opt/toolchain/aarch64-linux-gnu /opt/sysroot

# path
ENV PATH="/opt/toolchain/bin:${PATH}"
