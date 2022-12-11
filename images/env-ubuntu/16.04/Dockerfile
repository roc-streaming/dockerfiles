FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y \
    clang-3.6 \
    clang-3.7 \
    g++ \
    g++-4.8 \
    g++-4.9 \
    g++-5

# for 3rd-parties
RUN apt-get install -y \
    autoconf \
    automake \
    cmake \
    intltool \
    libtool \
    m4 \
    make \
    pkg-config \
    python

# for Roc
RUN apt-get install -y \
    doxygen \
    gengetopt \
    graphviz \
    libcpputest-dev \
    libpulse-dev \
    libsox-dev \
    libspeexdsp-dev \
    libunwind-dev \
    libuv1-dev \
    pulseaudio \
    ragel \
    scons

# extras
RUN apt-get install -y \
    git
