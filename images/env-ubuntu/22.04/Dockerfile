FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# compilers and tools
RUN apt-get install -y \
    ccache \
    clang \
    clang-11 \
    clang-12 \
    clang-13 \
    clang-14 \
    clang-15 \
    clang-format \
    g++ \
    g++-9 \
    g++-10 \
    g++-11 \
    g++-12 \
    git \
    python3 \
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
    meson \
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
