FROM debian:stable

ARG DIR
ARG NAME

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
RUN COMMIT=439b6198a9b340de5998dd14a26a0d9d38a6bcac; \
    wget -O /tmp/tools.zip \
    https://codeload.github.com/raspberrypi/tools/zip/${COMMIT} && \
    unzip /tmp/tools.zip -d /tmp && \
    mv /tmp/tools-${COMMIT}/arm-bcm2708/${DIR} /opt/toolchain && \
    rm -rf /tmp/tools-${COMMIT} && \
    rm /tmp/tools.zip

# sysroot
RUN ln -s /opt/toolchain/${NAME} /opt/sysroot

# path
ENV PATH="/opt/toolchain/bin:${PATH}"
