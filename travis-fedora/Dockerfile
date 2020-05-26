FROM fedora:latest

# compilers
RUN dnf install -y gcc-c++

# for 3rd-parties
RUN dnf install -y \
    pkgconfig \
    make \
    cmake

# for Roc
RUN dnf install -y \
    scons \
    ragel \
    gengetopt \
    doxygen \
    graphviz \
    libuv-devel \
    libunwind-devel \
    pulseaudio-libs-devel \
    sox-devel \
    google-benchmark-devel
