FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers and tools
RUN apt-get install -y \
    ccache \
    clang-3.4 \
    g++ \
    g++-4.4 \
    g++-4.6 \
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
    pkg-config \
    util-linux

# for roc
RUN apt-get install -y \
    doxygen \
    gengetopt \
    graphviz \
    libasound2-dev \
    libsndfile-dev \
    libsox-dev \
    libspeexdsp-dev \
    libunwind8-dev \
    pulseaudio \
    ragel \
    scons
