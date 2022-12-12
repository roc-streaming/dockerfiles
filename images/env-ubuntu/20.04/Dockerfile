FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y \
    clang \
    clang-10 \
    clang-7 \
    clang-8 \
    clang-9 \
    g++ \
    g++-10 \
    g++-7 \
    g++-8 \
    g++-9

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
    libbenchmark-dev \
    libcpputest-dev \
    libpulse-dev \
    libsox-dev \
    libspeexdsp-dev \
    libssl-dev \
    libunwind-dev \
    libuv1-dev \
    pulseaudio \
    ragel \
    scons

# for extras
RUN apt-get install -y  \
    clang-format \
    git \
    valgrind
