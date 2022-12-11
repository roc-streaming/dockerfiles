ARG OPENJDK
FROM $OPENJDK

ARG API="28"
ARG BUILD_TOOLS_VERSION="28.0.3"
ARG NDK_VERSION="21.1.6352462"
ARG CMAKE_VERSION="3.10.2.4988404"

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386

RUN apt-get update

# native compilers
RUN apt-get install -y \
    g++

# tools
RUN apt-get install -y \
    gengetopt \
    git \
    python \
    ragel \
    scons \
    sed \
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

# emulator dependencies
RUN apt-get install -y --no-install-recommends \
    lib32gcc1 \
    lib32ncurses6 \
    lib32z1 \
    libc6:i386 \
    libncurses5:i386 \
    libstdc++6:i386 \
    qt5-default \
    zlib1g:i386

ENV ANDROID_SDK_ROOT=$HOME/sdk
ENV PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/tools/bin
ENV PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
ENV PATH=$PATH:$ANDROID_SDK_ROOT/emulator
ENV LD_LIBRARY_PATH=$ANDROID_SDK_ROOT/emulator/lib64:$ANDROID_SDK_ROOT/emulator/lib64/qt/lib

# default env settings
ENV API=$API
ENV BUILD_TOOLS_VERSION=$BUILD_TOOLS_VERSION
ENV NDK_VERSION=$NDK_VERSION
ENV CMAKE_VERSION=$CMAKE_VERSION

RUN wget -q -O /tmp/cmd-tools.zip "https://dl.google.com/android/repository/commandlinetools-linux-6200805_latest.zip" && \
    mkdir -p $ANDROID_SDK_ROOT/cmdline-tools && \
    unzip -qq /tmp/cmd-tools.zip -d $ANDROID_SDK_ROOT/cmdline-tools && \
    rm /tmp/cmd-tools.zip

RUN mkdir $ANDROID_SDK_ROOT/cmdline-tools/tools/bin/jaxb_lib
RUN wget -q -O $ANDROID_SDK_ROOT/cmdline-tools/tools/bin/jaxb_lib/activation.jar \
        "https://repo1.maven.org/maven2/javax/activation/activation/1.1.1/activation-1.1.1.jar"
RUN wget -q -O $ANDROID_SDK_ROOT/cmdline-tools/tools/bin/jaxb_lib/jaxb-impl.jar \
        "https://repo1.maven.org/maven2/javax/xml/jaxb-impl/2.1/jaxb-impl-2.1.jar"
RUN wget -q -O $ANDROID_SDK_ROOT/cmdline-tools/tools/bin/jaxb_lib/jaxb-xjc.jar \
        "https://repo1.maven.org/maven2/org/glassfish/jaxb/jaxb-xjc/2.3.2/jaxb-xjc-2.3.2.jar"
RUN wget -q -O $ANDROID_SDK_ROOT/cmdline-tools/tools/bin/jaxb_lib/jaxb-core.jar \
        "https://repo1.maven.org/maven2/org/glassfish/jaxb/jaxb-core/2.3.0.1/jaxb-core-2.3.0.1.jar"
RUN wget -q -O $ANDROID_SDK_ROOT/cmdline-tools/tools/bin/jaxb_lib/jaxb-jxc.jar \
        "https://repo1.maven.org/maven2/org/glassfish/jaxb/jaxb-jxc/2.3.2/jaxb-jxc-2.3.2.jar"
RUN wget -q -O $ANDROID_SDK_ROOT/cmdline-tools/tools/bin/jaxb_lib/jaxb-runtime.jar \
        "https://repo1.maven.org/maven2/org/glassfish/jaxb/jaxb-runtime/2.3.1/jaxb-runtime-2.3.1.jar"
RUN wget -q -O $ANDROID_SDK_ROOT/cmdline-tools/tools/bin/jaxb_lib/jaxb-api.jar \
        "https://repo1.maven.org/maven2/javax/xml/bind/jaxb-api/2.3.1/jaxb-api-2.3.1.jar"

# add jaxb to sdkmanager classpath
RUN sed "/CLASSPATH=[$]APP_HOME/ a CLASSPATH=\$CLASSPATH:\$APP_HOME/bin/jaxb_lib/activation.jar:\$APP_HOME/bin/jaxb_lib/jaxb-impl.jar:\$APP_HOME/bin/jaxb_lib/jaxb-xjc.jar:\$APP_HOME/bin/jaxb_lib/jaxb-runtime.jar:\$APP_HOME/bin/jaxb_lib/jaxb-core.jar:\$APP_HOME/bin/jaxb_lib/jaxb-jxc.jar:\$APP_HOME/bin/jaxb_lib/jaxb-api.jar" $ANDROID_SDK_ROOT/cmdline-tools/tools/bin/sdkmanager > $ANDROID_SDK_ROOT/cmdline-tools/tools/bin/sdkmanager.tmp
RUN chmod +x $ANDROID_SDK_ROOT/cmdline-tools/tools/bin/sdkmanager.tmp
RUN mv -f $ANDROID_SDK_ROOT/cmdline-tools/tools/bin/sdkmanager.tmp $ANDROID_SDK_ROOT/cmdline-tools/tools/bin/sdkmanager

RUN mkdir -p $HOME/.android && touch $HOME/.android/repositories.cfg

RUN yes | sdkmanager --licenses
RUN yes | sdkmanager "emulator"

VOLUME [ "${ANDROID_SDK_ROOT}" ]

COPY entrypoint.sh /opt/entrypoint.sh

# expose adb server port
EXPOSE 5037

ENTRYPOINT ["/opt/entrypoint.sh"]
