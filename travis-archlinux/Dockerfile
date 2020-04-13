FROM archlinux/base:latest

RUN pacman -Sy

# compilers
RUN pacman --noconfirm -S gcc libffi

# for 3rd-parties
RUN pacman --noconfirm -S \
    grep \
    gawk \
    pkgconf \
    make \
    cmake

# for Roc
RUN pacman --noconfirm -S \
    scons \
    ragel \
    gengetopt \
    doxygen \
    graphviz \
    libuv \
    libunwind \
    libatomic_ops \
    libpulse \
    sox
