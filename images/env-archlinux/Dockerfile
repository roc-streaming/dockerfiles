FROM archlinux:latest

RUN pacman --noconfirm -Syu

# compilers and tools
RUN pacman --noconfirm -S \
    ccache \
    gcc \
    git \
    libffi \
    python

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
    util-linux-libs

# for roc
RUN pacman --noconfirm -S \
    alsa-lib \
    benchmark \
    cpputest \
    doxygen \
    gengetopt \
    graphviz \
    gsm \
    libpulse \
    libsndfile \
    libunwind \
    libuv \
    openssl \
    ragel \
    scons \
    sox \
    speexdsp

# for fontconfig
ENV HOME=/home
RUN chmod a+wx /home
