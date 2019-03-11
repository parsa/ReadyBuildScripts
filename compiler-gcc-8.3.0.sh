#/bin/bash

#++ GCC 8.3.0 ++

set -eo pipefail

export VERSION=8.3.0
export TARBALL=gcc-${VERSION}.tar.xz
export MIRROR=ftp://gcc.gnu.org/pub/gcc/releases/gcc-${VERSION}
export URL=${MIRROR}/${TARBALL}
export URL_SIG=${MIRROR}/${TARBALL}.sig

INSTALL_DIR=${1}
PROCESSOR_COUNT=$(($(grep -c processor /proc/cpuinfo) + 2))

mkdir -p gcc/${VERSION}/{src,build}
(
    cd gcc/${VERSION}
    (
        cd src
        curl -JLO ${URL}
        tar xf ${TARBALL} --strip-components=1
        ./contrib/download_prerequisites
    )
    (
        cd build
        ../src/configure \
            ${INSTALL_DIR:+--prefix=$INSTALL_DIR} \
            --program-suffix="-${VERSION%.*}" \
            --enable-languages=c,c++,fortran \
            --enable-tls --enable-static \
            --enable-shared \
            --disable-bootstrap \
            --disable-multilib
        make -j$PROCESSOR_COUNT
        make -j$PROCESSOR_COUNT install-strip
    )
)
