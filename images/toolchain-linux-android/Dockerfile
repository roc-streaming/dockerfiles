FROM debian:stable

ENV DEBIAN_FRONTEND=noninteractive

ARG NDK="21"
ARG PLATFORM="linux-x86_64"

RUN apt-get update

# native compilers and tools
RUN apt-get install -y \
    ccache \
    g++ \
    python3 \
    unzip \
    wget

# for 3rd-parties
RUN apt-get install -y \
    autoconf \
    automake \
    automake1.11 \
    cmake \
    intltool \
    libtool \
    make \
    pkg-config

# for roc
RUN apt-get install -y \
    gengetopt \
    ragel \
    scons

# toolchain
RUN wget -q -O /tmp/ndk.zip \
    "https://dl.google.com/android/repository/android-ndk-r${NDK}-${PLATFORM}.zip" && \
    ( cd /tmp && unzip -qq ndk.zip -d /opt) && \
    rm /tmp/ndk.zip

# path
ENV PATH="/opt/android-ndk-r${NDK}/toolchains/llvm/prebuilt/linux-x86_64/bin:${PATH}"
ENV ANDROID_NDK_ROOT="/opt/android-ndk-r${NDK}"
