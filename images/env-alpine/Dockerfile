FROM alpine

RUN apk update

# compilers
RUN apk add g++

# for 3rd-parties
RUN apk add \
    pkgconfig \
    libtool \
    intltool \
    m4 \
    autoconf \
    automake \
    make \
    cmake

# for Roc
RUN apk add \
    python3 \
    scons \
    ragel \
    gengetopt \
    doxygen \
    graphviz \
    cpputest \
    libuv-dev \
    libunwind-dev \
    speexdsp-dev \
    sox-dev \
    pulseaudio-dev

# extras
RUN apk add \
    git
