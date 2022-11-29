FROM archlinux:latest

RUN pacman --noconfirm -Syu

# compilers
RUN pacman --noconfirm -S gcc libffi

# for 3rd-parties
RUN pacman --noconfirm -S \
    grep \
    gawk \
    pkgconf \
    libtool \
    intltool \
    m4 \
    autoconf \
    automake \
    make \
    cmake \
    python

# for Roc
RUN pacman --noconfirm -S \
    scons \
    ragel \
    gengetopt \
    doxygen \
    graphviz \
    libuv \
    libunwind \
    speexdsp \
    sox \
    gsm \
    libpulse

# extras
RUN pacman --noconfirm -S \
    git
