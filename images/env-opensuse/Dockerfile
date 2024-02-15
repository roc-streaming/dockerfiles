FROM opensuse/leap:latest

# compilers and tools
RUN zypper -n install \
    ccache \
    gcc-c++ \
    git \
    python

# for 3rd-parties
RUN zypper -n install \
    autoconf \
    automake \
    cmake \
    intltool \
    libtool \
    m4 \
    make \
    pkg-config

# for roc
RUN zypper -n install \
    alsa-devel \
    benchmark-devel \
    doxygen \
    gengetopt \
    graphviz \
    libopenssl-3-devel \
    libpulse-devel \
    libsndfile-devel \
    libunwind-devel \
    libuv-devel \
    ragel \
    scons \
    sox-devel \
    speexdsp-devel
