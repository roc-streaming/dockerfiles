FROM debian:stable

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y g++

# for 3rd-parties
RUN apt-get install -y \
    pkg-config \
    libtool \
    autoconf \
    automake \
    make \
    cmake

# for Roc
RUN apt-get install -y \
    scons \
    ragel \
    gengetopt \
    doxygen \
    graphviz \
    libunwind-dev \
    libatomic-ops-dev \
    libpulse-dev \
    libsox-dev \
    libbenchmark-dev
