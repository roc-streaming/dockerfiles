FROM alpine

RUN apk update

# compilers
RUN apk add \
    g++

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

# for Roc
RUN apk add \
    cpputest \
    doxygen \
    gengetopt \
    graphviz \
    libunwind-dev \
    libuv-dev \
    pulseaudio-dev \
    python3 \
    ragel \
    scons \
    sox-dev \
    speexdsp-dev

# extras
RUN apk add \
    bash \
    git
