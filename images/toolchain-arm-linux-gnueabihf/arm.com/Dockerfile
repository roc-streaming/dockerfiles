FROM debian:stable

ENV DEBIAN_FRONTEND noninteractive

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
    wget \
    xz-utils

ARG VERSION
ARG DATE

# toolchain
RUN TOOLCHAIN="arm-none-linux-gnueabihf"; \
    ARCH="x86_64"; \
    ARCHIVE="gcc-arm-${VERSION}-${DATE}-${ARCH}-${TOOLCHAIN}"; \
    MIRROR="https://developer.arm.com/-/media/Files/downloads"; \
    wget -O - "${MIRROR}/gnu-a/${VERSION}-${DATE}/binrel/${ARCHIVE}.tar.xz" | \
        tar -C /opt -xJf - && \
    mv /opt/${ARCHIVE} /opt/toolchain

# libc
RUN cp -a /opt/toolchain/arm-none-linux-gnueabihf/libc/lib/* \
    /opt/toolchain/arm-none-linux-gnueabihf/lib

# sysroot
RUN ln -s /opt/toolchain/arm-none-linux-gnueabihf /opt/sysroot

# path
ENV PATH="/opt/toolchain/bin:${PATH}"
