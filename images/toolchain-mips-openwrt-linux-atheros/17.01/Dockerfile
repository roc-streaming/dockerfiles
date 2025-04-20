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
    wget

# toolchain dependencies
RUN apt-get install -y \
    libgcc1:i386 \
    libstdc++6:i386 \
    zlib1g:i386

# toolchain
RUN TOOLCHAIN="mips-atheros-openwrt-linux-musl"; \
    TARGET="ar71xx/generic"; \
    ARCHIVE="lede-sdk-${OPENWRT}-ar71xx-generic_gcc-${GCC}_musl-${MUSL}.Linux-x86_64"; \
    MIRROR="https://archive.openwrt.org/releases"; \
    wget -O - "${MIRROR}/${OPENWRT}/targets/${TARGET}/${ARCHIVE}.tar.xz" | \
        tar -C /opt -xJf - && \
    mv /opt/${ARCHIVE}/staging_dir /opt && \
    rm -rf /opt/${ARCHIVE}

# symlinks
RUN ln -s /opt/staging_dir/toolchain-* \
    /opt/toolchain
RUN ln -s /opt/toolchain/mips-openwrt-linux-musl \
    /opt/sysroot

# staging
ENV STAGING_DIR=/opt/staging_dir

# path
ENV PATH="/opt/toolchain/bin:${PATH}"
