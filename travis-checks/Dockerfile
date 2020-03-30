FROM ubuntu:19.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y g++ clang

# for 3rd-parties
RUN apt-get install -y \
    libtool \
    intltool \
    autoconf \
    automake \
    make \
    cmake

# for Roc
RUN apt-get install -y \
    scons \
    libasound2-dev \
    libpulse-dev

# for checks
RUN apt-get install -y \
    valgrind

# for scons fmt
RUN apt-get install -y  \
    clang-format \
    git