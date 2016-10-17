#/bin/bash
TOOLS_DIR="$2"
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi
if [ ! -d $TOOLS_DIR ]; then
    $TOOLS_DIR=$LOCAL_PATH
fi

mkdir -p gcc/binutils/build
pushd gcc/binutils
curl -O http://ftp.gnu.org/gnu/binutils/binutils-2.24.tar.gz
tar xf binutils-2.24.tar.gz
pushd binutils-2.24
./configure --prefix=$LOCAL_PATH --with-mpc=$TOOLS_DIR --with-mpfr=$TOOLS_DIR --with-gmp=$TOOLS_DIR --with-cloog=$TOOLS_DIR --with-isl=$TOOLS_DIR
make $LOCAL_MAKEFLAGS install

