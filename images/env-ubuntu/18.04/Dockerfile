FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers and tools
RUN apt-get install -y \
    ccache \
    clang-6.0 \
    g++ \
    g++-6 \
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
    libssl-dev \
    libunwind-dev \
    libuv1-dev \
    pulseaudio \
    ragel \
    scons
