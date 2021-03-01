FROM archlinux/base:latest

RUN pacman --noconfirm -Syu

# https://bugs.archlinux.org/task/69563
# https://stackoverflow.com/a/66184907/3169754
RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
    curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
    bsdtar -C / -xvf "$patched_glibc"

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
    speexdsp \
    sox \
    libpulse
