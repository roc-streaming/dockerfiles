FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y \
    g++ \
    g++-6 \
    clang-6.0

# for 3rd-parties
RUN apt-get install -y \
    pkg-config \
    libtool \
    intltool \
    m4 \
    autoconf \
    automake \
    make \
    cmake \
    python

# for Roc
RUN apt-get install -y \
    scons \
    ragel \
    gengetopt \
    doxygen \
    graphviz \
    pulseaudio \
    libuv1-dev \
    libunwind-dev \
    libspeexdsp-dev \
    libsox-dev \
    libpulse-dev \
    libcpputest-dev

# extras
RUN apt-get install -y \
    git
