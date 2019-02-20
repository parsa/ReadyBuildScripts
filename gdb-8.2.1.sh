#/usr/bin/env bash

set -eo pipefail

# Dependencies: texinfo
export VERSION_TEXINFO=6.6
export TARBALL_TEXINFO=texinfo-${VERSION_TEXINFO}.tar.xz
#export MIRROR_TEXINFO=https://ftp.gnu.org/gnu/texinfo
export MIRROR_TEXINFO=https://mirrors.kernel.org/gnu/texinfo
export URL_TEXINFO=${MIRROR_TEXINFO}/${TARBALL_TEXINFO}
export URL_TEXINFO_SIG=${MIRROR_TEXINFO}/${TARBALL_TEXINFO}.sig

mkdir -p texinfo/{src,build}
(
    cd texinfo/src
    wget $URL_TEXINFO 2>/dev/null || curl -O $URL_TEXINFO
    wget $URL_TEXINFO_SIG 2>/dev/null || curl -O $URL_TEXINFO_SIG
    gpg --list-packets ${TARBALL_TEXINFO}.sig
    gpg --recv DDBC579DAB37FBA9
    if ! gpg --verify ${TARBALL_TEXINFO}.sig; then
        echo 'Could not verify the downloaded tarball signature. Abort.' >&2
        exit 1
    fi

    tar xJf ${TARBALL_TEXINFO} --strip-components=1
)
(
    cd texinfo/build
    ../src/configure ${LOCAL_PATH:+"--prefix=${LOCAL_PATH}"}
    make $LOCAL_MAKEFLAGS
    make install
)

# GDB
export VERSION=8.2.1
export TARBALL=gdb-${VERSION}.tar.xz
export MIRROR=https://mirrors.kernel.org/gnu/gdb
#export MIRROR=ftp://sourceware.org/pub/gdb/releases # Does not have .sig
export URL=${MIRROR}/${TARBALL}
export URL_SIG=${MIRROR}/${TARBALL}.sig

mkdir -p gdb/{src,build}
(
    cd gdb/src
    wget $URL 2>/dev/null || curl -O $URL
    wget $URL_SIG 2>/dev/null || curl -O $URL_SIG
    gpg --list-packets ${TARBALL}.sig
    gpg --recv 92EDB04BFF325CF3
    if ! gpg --verify ${TARBALL}.sig; then
        echo 'Could not verify the downloaded tarball signature. Abort.' >&2
        exit 1
    fi

    tar xJf ${TARBALL} --strip-components=1
)
(
    cd gdb/build
    ../src/configure --with-python ${LOCAL_PATH:+"--prefix=${LOCAL_PATH}"}
    make $LOCAL_MAKEFLAGS
    make install
)
