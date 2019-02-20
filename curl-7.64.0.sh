#/usr/bin/env bash

set -eo pipefail

export VERSION=7.64.0
export TARBALL=curl-${VERSION}.tar.xz
export URL=https://curl.haxx.se/download/${TARBALL}
export URL_ASC=https://curl.haxx.se/download/${TARBALL}.asc
export KEYSERVER=pgpkeys.uk  #keys.gnupg.net

mkdir -p curl/{src,build}
(
    cd curl/src
    wget $URL 2>/dev/null || curl -O $URL
    wget $URL_ASC 2>/dev/null || curl -O $URL_ASC
    gpg --list-packets ${TARBALL}.asc
    gpg --keyserver ${KEYSERVER} --recv 5CC908FDB71E12C2
    if ! gpg --verify ${TARBALL}.asc; then
        echo 'Could not verify the downloaded tarball signature. Abort.' >&2
        exit 1
    fi
    tar xJf ${TARBALL} --strip-components=1
)
(
    cd curl/build
    ../src/configure ${LOCAL_PATH:+"--prefix=${LOCAL_PATH}"}
    make $LOCAL_MAKEFLAGS install
)
