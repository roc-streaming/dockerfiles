FROM archlinux:latest

RUN pacman --noconfirm -Syu

# compilers
RUN pacman --noconfirm -S \
    gcc \
    libffi

# for 3rd-parties
RUN pacman --noconfirm -S \
    autoconf \
    automake \
    cmake \
    gawk \
    grep \
    intltool \
    libtool \
    m4 \
    make \
    pkgconf \
    python

# for Roc
RUN pacman --noconfirm -S \
    doxygen \
    gengetopt \
    graphviz \
    gsm \
    libpulse \
    libunwind \
    libuv \
    ragel \
    scons \
    sox \
    speexdsp

# extras
RUN pacman --noconfirm -S \
    git
