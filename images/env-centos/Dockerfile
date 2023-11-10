FROM centos:7

RUN yum -y install epel-release

# compilers and tools
RUN yum -y install \
    ccache \
    gcc-c++ \
    git

# for 3rd-parties
RUN yum -y install \
    autoconf \
    automake \
    cmake \
    libtool \
    make \
    pkgconfig

# for roc
RUN yum -y install \
    gengetopt \
    libunwind-devel \
    openssl11-devel \
    pulseaudio-libs-devel \
    ragel \
    scons \
    sox-devel \
    speex-devel
