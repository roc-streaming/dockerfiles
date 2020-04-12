FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y \
    g++ \
    g++-6 \
    clang-6.0

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
    graphviz \
    libuv1-dev \
    libunwind-dev \
    libatomic-ops-dev \
    libpulse-dev \
    libsox-dev \
    libcpputest-dev
