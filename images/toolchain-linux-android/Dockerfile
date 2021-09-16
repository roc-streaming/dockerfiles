FROM debian:stable

ENV DEBIAN_FRONTEND noninteractive

ARG NDK="21"

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
    automake1.11 \
    pkg-config \
    make \
    cmake

# toolchain
RUN wget -q -O /tmp/ndk.zip \
    "https://dl.google.com/android/repository/android-ndk-r${NDK}-linux-x86_64.zip" && \
    ( cd /tmp && unzip -qq ndk.zip -d /opt) && \
    rm /tmp/ndk.zip

# path
ENV PATH="/opt/android-ndk-r${NDK}/toolchains/llvm/prebuilt/linux-x86_64/bin:${PATH}"
