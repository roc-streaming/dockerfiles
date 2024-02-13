FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers and tools
RUN apt-get install -y \
    ccache \
    clang-3.6 \
    clang-3.7 \
    g++ \
    g++-4.8 \
    g++-4.9 \
    g++-5 \
    git \
    python

# for 3rd-parties
RUN apt-get install -y \
    autoconf \
    automake \
    cmake \
    intltool \
    libtool \
    m4 \
    make \
    pkg-config

# for roc
RUN apt-get install -y \
    doxygen \
    gengetopt \
    graphviz \
    libasound2-dev \
    libcpputest-dev \
    libpulse-dev \
    libsndfile-dev \
    libsox-dev \
    libspeexdsp-dev \
    libunwind-dev \
    libuv1-dev \
    pulseaudio \
    ragel \
    scons
