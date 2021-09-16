FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y \
    g++ \
    g++-4.8 \
    g++-4.9 \
    g++-5 \
    clang-3.6 \
    clang-3.7

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
