FROM alpine:latest

RUN apk update

# compilers and tools
RUN apk add \
    bash \
    ccache \
    g++ \
    git \
    python3

# for 3rd-parties
RUN apk add \
    autoconf \
    automake \
    cmake \
    intltool \
    libtool \
    m4 \
    make \
    pkgconfig \
    util-linux-dev

# for roc
RUN apk add \
    alsa-lib-dev \
    benchmark \
    cpputest \
    doxygen \
    gengetopt \
    graphviz \
    libsndfile-dev \
    libunwind-dev \
    libuv-dev \
    openssl-dev \
    pulseaudio-dev \
    ragel \
    scons \
    sox-dev \
    speexdsp-dev
