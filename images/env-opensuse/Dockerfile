FROM opensuse/leap:latest

# compilers
RUN zypper -n install \
    gcc-c++

# for 3rd-parties
RUN zypper -n install \
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
RUN zypper -n install \
    benchmark-devel \
    doxygen \
    gengetopt \
    graphviz \
    libpulse-devel \
    libunwind-devel \
    libuv-devel \
    ragel \
    scons \
    sox-devel \
    speexdsp-devel

# extras
RUN zypper -n install \
    git
