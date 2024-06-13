FROM debian:stable

ARG OPENWRT
ARG UCLIBC
ARG GCC

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN apt-get update

RUN apt-get install -y \
    autoconf \
    automake \
    automake1.11 \
    ccache \
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
    unzip \
    wget

# toolchain dependencies
RUN apt-get install -y \
    libgcc1:i386 \
    libstdc++6:i386 \
    zlib1g:i386

# toolchain
RUN TOOLCHAIN="mips-atheros-openwrt-linux-uclibc"; \
    TARGET="atheros/generic"; \
    ARCHIVE="OpenWrt-Toolchain-atheros-for-mips-gcc-${GCC}-linaro_uClibc-${UCLIBC}"; \
    MIRROR="https://archive.openwrt.org/attitude_adjustment"; \
    wget -O - "${MIRROR}/${OPENWRT}/${TARGET}/${ARCHIVE}.tar.bz2" | \
        tar -C /opt -xjf - && \
    mv /opt/${ARCHIVE}/toolchain-* /opt/toolchain && \
    rm -rf /opt/${ARCHIVE}

# sysroot
RUN ln -s /opt/toolchain/mips-openwrt-linux-uclibc \
    /opt/sysroot

# staging
RUN mkdir -p /opt/staging
ENV STAGING_DIR=/opt/staging

# path
ENV PATH="/opt/toolchain/bin:${PATH}"
