FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers and tools
RUN apt-get install -y \
    ccache \
    clang \
    clang-10 \
    clang-7 \
    clang-8 \
    clang-9 \
    clang-format \
    g++ \
    g++-10 \
    g++-7 \
    g++-8 \
    g++-9 \
    git \
    python \
    valgrind

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
    uuid-dev

# for roc
RUN apt-get install -y \
    doxygen \
    gengetopt \
    graphviz \
    libasound2-dev \
    libbenchmark-dev \
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
