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
    qemu

# roc dependencies
RUN apt-get install -y \
    libtool \
    intltool \
    autoconf \
    automake \
    make \
    cmake

# toolchain
RUN TOOLCHAIN="aarch64-linux-gnu"; \
    MAJOR="7.4"; \
    MINOR="1"; \
    DATE="2019.02"; \
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
