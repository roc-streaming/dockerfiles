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
    libuuid-devel \
    m4 \
    make \
    pkgconfig

# for roc
RUN dnf install -y \
    alsa-lib-devel \
    cpputest-devel \
    doxygen \
    gengetopt \
    google-benchmark-devel \
    graphviz \
    libsndfile-devel \
    libunwind-devel \
    libuv-devel \
    openssl-devel \
    pulseaudio-libs-devel \
    ragel \
    scons \
    sox-devel \
    speexdsp-devel

# for fontconfig
ENV HOME=/home
RUN chmod a+wx /home
