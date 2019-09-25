FROM debian:stable

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# native compilers
RUN apt-get install -y g++

# tools
RUN apt-get install -y \
    scons \
    ragel \
    gengetopt \
    python \
    unzip \
    wget

# Roc dependencies
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
RUN NDK="r18"; \
    API="28"; \
    ARCH="arm64"; \
    wget -O /tmp/ndk.zip \
    "https://dl.google.com/android/repository/android-ndk-${NDK}-linux-x86_64.zip" && \
    ( cd /tmp && unzip -q /tmp/ndk.zip ) && \
    /tmp/android-ndk-${NDK}/build/tools/make_standalone_toolchain.py \
        --arch ${ARCH} --api ${API} --install-dir /opt/toolchain && \
    rm -rf /tmp/android-ndk-${NDK} /tmp/ndk.zip

# path
ENV PATH="/opt/toolchain/bin:${PATH}"
