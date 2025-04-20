FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

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
RUN TOOLCHAIN="aarch64-none-linux-gnu"; \
    ARCH="x86_64"; \
    ARCHIVE="arm-gnu-toolchain-${VERSION}-${ARCH}-${TOOLCHAIN}"; \
    MIRROR="https://developer.arm.com/-/media/Files/downloads"; \
    wget -O - "${MIRROR}/gnu/${VERSION}/binrel/${ARCHIVE}.tar.xz" | \
        tar -C /opt -xJf - && \
    mv /opt/${ARCHIVE} /opt/toolchain

# libc
RUN cp -a /opt/toolchain/aarch64-none-linux-gnu/libc/lib/* \
    /opt/toolchain/aarch64-none-linux-gnu/lib && \
    cp -a /opt/toolchain/aarch64-none-linux-gnu/libc/lib64/* \
    /opt/toolchain/aarch64-none-linux-gnu/lib64

# sysroot
RUN ln -s /opt/toolchain/aarch64-none-linux-gnu \
    /opt/sysroot

# path
ENV PATH="/opt/toolchain/bin:${PATH}"
