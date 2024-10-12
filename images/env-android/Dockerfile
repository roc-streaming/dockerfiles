ARG OPENJDK="openjdk:17-jdk-slim-buster"
FROM $OPENJDK

ARG API_LEVEL="29"
ARG BUILD_TOOLS_VERSION="35.0.0"
ARG NDK_VERSION="26.3.11579264"
ARG CMAKE_VERSION="3.18.1"

ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386

RUN apt-get update

# native compilers and tools
RUN apt-get install -y \
    g++ \
    git \
    python \
    sed \
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

# for emulator
RUN apt-get install -y --no-install-recommends \
    lib32gcc1 \
    lib32ncurses6 \
    lib32z1 \
    libc6:i386 \
    libncurses5:i386 \
    libstdc++6:i386 \
    qt5-default \
    zlib1g:i386

ENV ANDROID_SDK_ROOT=/sdk
ENV PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin
ENV PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
ENV PATH=$PATH:$ANDROID_SDK_ROOT/emulator
ENV LD_LIBRARY_PATH=$ANDROID_SDK_ROOT/emulator/lib64:$ANDROID_SDK_ROOT/emulator/lib64/qt/lib

# default env settings
ENV API_LEVEL=$API_LEVEL
ENV BUILD_TOOLS_VERSION=$BUILD_TOOLS_VERSION
ENV NDK_VERSION=$NDK_VERSION
ENV CMAKE_VERSION=$CMAKE_VERSION

# curl -s https://dl.google.com/android/repository/repository2-1.xml | grep commandlinetools-linux
RUN wget -q -O /tmp/cmd-tools.zip \
    "https://dl.google.com/android/repository/commandlinetools-linux-12266719_latest.zip" && \
    mkdir -p $ANDROID_SDK_ROOT/cmdline-tools/latest && \
    unzip -qq /tmp/cmd-tools.zip -d /tmp && \
    mv /tmp/cmdline-tools /tmp/latest && \
    mkdir -p $ANDROID_SDK_ROOT/cmdline-tools && \
    mv /tmp/latest $ANDROID_SDK_ROOT/cmdline-tools/ && \
    rm /tmp/cmd-tools.zip

RUN mkdir -p /.android && touch /.android/repositories.cfg

RUN yes | sdkmanager --licenses
RUN yes | sdkmanager "emulator"

VOLUME [ "${ANDROID_SDK_ROOT}" ]

COPY entrypoint.sh /opt/entrypoint.sh
COPY device.sh /usr/bin/device

# expose adb server port
EXPOSE 5037

ENTRYPOINT ["/opt/entrypoint.sh"]
