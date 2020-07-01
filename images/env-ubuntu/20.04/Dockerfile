FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y \
    g++ \
    g++-7 \
    g++-8 \
    g++-9 \
    g++-10 \
    clang-7 \
    clang-8 \
    clang-9 \
    clang-10

# for 3rd-parties
RUN apt-get install -y \
    pkg-config \
    intltool \
    m4 \
    make \
    cmake

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
    libpulse-dev \
    libcpputest-dev \
    libbenchmark-dev

# for build checks
RUN apt-get install -y  \
    clang-format \
    git

# for runtime checks
RUN apt-get install -y \
    valgrind
