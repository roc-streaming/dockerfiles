FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y \
    clang \
    clang-11 \
    clang-12 \
    clang-13 \
    clang-14 \
    g++ \
    g++-10 \
    g++-11 \
    g++-12

# for 3rd-parties
RUN apt-get install -y \
    autoconf \
    automake \
    cmake \
    intltool \
    libtool \
    m4 \
    make \
    meson \
    pkg-config \
    python3

# for Roc
RUN apt-get install -y \
    doxygen \
    gengetopt \
    graphviz \
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

# for extras
RUN apt-get install -y  \
    clang-format \
    git \
    valgrind
