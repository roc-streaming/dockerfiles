FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y \
    g++ \
    g++-6 \
    clang-6.0

# tools
RUN apt-get install -y \
    pkg-config \
    scons \
    gengetopt \
    doxygen \
    graphviz

# dependencies
RUN apt-get install -y \
    libuv1-dev \
    libsox-dev \
    libcpputest-dev \
    intltool \
    m4 \
    make \
    cmake
