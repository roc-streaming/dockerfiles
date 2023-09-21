FROM debian:stable

ENV DEBIAN_FRONTEND noninteractive

ARG NDK="21"

RUN apt-get update

# native compilers
RUN apt-get install -y \
    g++

# tools
RUN apt-get install -y \
    gengetopt \
    python3 \
    ragel \
    scons \
    unzip \
    wget

# Roc dependencies
RUN apt-get install -y \
    autoconf \
    automake \
    automake1.11 \
    cmake \
    intltool \
    libtool \
    make \
    pkg-config

# toolchain
RUN wget -q -O /tmp/ndk.zip \
    "https://dl.google.com/android/repository/android-ndk-r${NDK}-linux-x86_64.zip" && \
    ( cd /tmp && unzip -qq ndk.zip -d /opt) && \
    rm /tmp/ndk.zip

# path
ENV PATH="/opt/android-ndk-r${NDK}/toolchains/llvm/prebuilt/linux-x86_64/bin:${PATH}"
ENV ANDROID_NDK_ROOT="/opt/android-ndk-r${NDK}"
