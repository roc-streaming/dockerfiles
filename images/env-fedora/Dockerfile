FROM fedora:latest

# compilers
RUN dnf install -y \
    gcc-c++

# for 3rd-parties
RUN dnf install -y \
    autoconf \
    automake \
    cmake \
    intltool \
    libtool \
    m4 \
    make \
    pkgconfig \
    python

# for Roc
RUN dnf install -y \
    doxygen \
    gengetopt \
    google-benchmark-devel \
    graphviz \
    libunwind-devel \
    libuv-devel \
    pulseaudio-libs-devel \
    ragel \
    scons \
    sox-devel \
    speexdsp-devel

# extras
RUN dnf install -y \
    git
