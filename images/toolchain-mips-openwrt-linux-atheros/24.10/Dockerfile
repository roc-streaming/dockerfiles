FROM debian:stable

ARG OPENWRT
ARG MUSL
ARG GCC

ENV DEBIAN_FRONTEND=noninteractive

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
    wget \
    zstd

# toolchain dependencies
RUN apt-get install -y \
    libgcc1:i386 \
    libstdc++6:i386 \
    zlib1g:i386

# toolchain
RUN TOOLCHAIN="mips-atheros-openwrt-linux-musl"; \
    TARGET="ath79/generic"; \
    ARCHIVE="openwrt-toolchain-${OPENWRT}-ath79-generic_gcc-${GCC}_musl.Linux-x86_64"; \
    MIRROR="https://archive.openwrt.org/releases"; \
    wget -O - "${MIRROR}/${OPENWRT}/targets/${TARGET}/${ARCHIVE}.tar.zst" | \
        tar -C /opt --zstd -xf - && \
    mv /opt/${ARCHIVE}/toolchain-mips_24kc_gcc-${GCC}_musl /opt/toolchain && \
    rm -rf /opt/${ARCHIVE}

# sysroot
RUN ln -s /opt/toolchain/mips-openwrt-linux-musl /opt/sysroot

# staging
ENV STAGING_DIR=/opt

# path
ENV PATH="/opt/toolchain/bin:${PATH}"
