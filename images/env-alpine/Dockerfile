FROM alpine

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
    pkgconfig

# for roc
RUN apk add \
    cpputest \
    doxygen \
    gengetopt \
    graphviz \
    libunwind-dev \
    libuv-dev \
    openssl-dev \
    pulseaudio-dev \
    ragel \
    scons \
    sox-dev \
    speexdsp-dev
