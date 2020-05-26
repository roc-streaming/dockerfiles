FROM opensuse/leap:latest

# compilers
RUN zypper -n install gcc-c++

# for 3rd-parties
RUN zypper -n install \
    pkg-config \
    libtool \
    autoconf \
    automake \
    make \
    cmake 

# for Roc
RUN zypper -n install \
    scons \
    ragel \
    gengetopt \
    doxygen \
    graphviz \
    libuv-devel \
    libunwind-devel \
    libpulse-devel \
    sox-devel \
    benchmark-devel
