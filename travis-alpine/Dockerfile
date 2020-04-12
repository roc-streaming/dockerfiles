FROM alpine

RUN apk update

# compilers
RUN apk add g++

# for 3rd-parties
RUN apk add \
    pkgconfig \
    libtool \
    autoconf \
    automake \
    make \
    cmake

# for Roc
RUN apk add \
    python \
    scons \
    ragel \
    gengetopt \
    doxygen \
    graphviz \
    cpputest \
    libuv-dev \
    libunwind-dev \
    libatomic_ops-dev \
    pulseaudio-dev \
    sox-dev
