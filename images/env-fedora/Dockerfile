FROM fedora:latest

# compilers and tools
RUN dnf install -y \
    ccache \
    gcc-c++ \
    git \
    python

# for 3rd-parties
RUN dnf install -y \
    autoconf \
    automake \
    cmake \
    intltool \
    libtool \
    m4 \
    make \
    pkgconfig

# for roc
RUN dnf install -y \
    alsa-lib-devel \
    doxygen \
    gengetopt \
    google-benchmark-devel \
    graphviz \
    libunwind-devel \
    libuv-devel \
    openssl-devel \
    pulseaudio-libs-devel \
    ragel \
    scons \
    sox-devel \
    speexdsp-devel
