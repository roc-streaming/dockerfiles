FROM ubuntu

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
    make

# for roc
RUN apt-get install -y \
    libasound2-dev \
    libpulse-dev \
    scons
