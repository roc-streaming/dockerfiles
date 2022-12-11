FROM debian:stable

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y \
    g++

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
    libpulse-dev \
    libsox-dev \
    libspeexdsp-dev \
    libunwind-dev \
    ragel \
    scons

# extras
RUN apt-get install -y \
    git
