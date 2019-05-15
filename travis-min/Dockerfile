FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

# compilers
RUN apt-get install -y g++

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
