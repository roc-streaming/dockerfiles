FROM opensuse/leap:latest

# compilers
RUN zypper -n install gcc-c++

# for 3rd-parties
RUN zypper -n install \
    pkg-config \
    libtool \
    intltool \
    m4 \
    autoconf \
    automake \
    make \
    cmake \
    python

# for Roc
RUN zypper -n install \
    scons \
    ragel \
    gengetopt \
    doxygen \
    graphviz \
    libuv-devel \
    libunwind-devel \
    speexdsp-devel \
    sox-devel \
    libpulse-devel \
    benchmark-devel
