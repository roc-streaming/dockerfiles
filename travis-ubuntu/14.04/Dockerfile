FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get update && apt-get install -y \
    g++ \
    g++-4.4 \
    g++-4.6 \
    clang-3.4

# tools
RUN apt-get install -y \
    pkg-config \
    scons \
    gengetopt \
    doxygen \
    graphviz

# dependencies
RUN apt-get install -y \
    libsox-dev \
    libtool \
    autoconf \
    automake \
    intltool \
    m4 \
    make \
    cmake
