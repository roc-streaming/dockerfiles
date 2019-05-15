FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y \
    g++ \
    g++-4.4 \
    g++-4.6 \
    clang-3.4

# for 3rd-parties
RUN apt-get install -y \
    pkg-config \
    libtool \
    autoconf \
    automake \
    intltool \
    m4 \
    make \
    cmake

# for Roc
RUN apt-get install -y \
    scons \
    gengetopt \
    doxygen \
    graphviz \
    libsox-dev
