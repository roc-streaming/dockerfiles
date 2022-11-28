FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y \
    g++ \
    g++-10 \
    g++-11 \
    g++-12 \
    clang \
    clang-11 \
    clang-12 \
    clang-13 \
    clang-14

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
    meson \
    python3

# for Roc
RUN apt-get install -y \
    scons \
    ragel \
    gengetopt \
    doxygen \
    pulseaudio \
    graphviz \
    libuv1-dev \
    libunwind-dev \
    libspeexdsp-dev \
    libsox-dev \
    libsndfile-dev \
    libpulse-dev \
    libcpputest-dev \
    libbenchmark-dev

# for extras
RUN apt-get install -y  \
    clang-format \
    git \
    valgrind
