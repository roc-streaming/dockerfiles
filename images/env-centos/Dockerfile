FROM centos:7

RUN yum -y install epel-release

# compilers
RUN yum -y install gcc-c++

# for 3rd-parties
RUN yum -y install \
    pkgconfig \
    libtool \
    autoconf \
    automake \
    make \
    cmake

# for Roc
RUN yum -y install \
    scons \
    ragel \
    gengetopt \
    libunwind-devel \
    speex-devel \
    sox-devel \
    pulseaudio-libs-devel
