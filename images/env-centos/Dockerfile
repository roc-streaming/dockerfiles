FROM centos:7

RUN yum -y install epel-release

# compilers
RUN yum -y install \
    gcc-c++

# for 3rd-parties
RUN yum -y install \
    autoconf \
    automake \
    cmake \
    libtool \
    make \
    pkgconfig

# for Roc
RUN yum -y install \
    gengetopt \
    libunwind-devel \
    pulseaudio-libs-devel \
    ragel \
    scons \
    sox-devel \
    speex-devel
