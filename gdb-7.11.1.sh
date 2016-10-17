#/bin/bash
URL_1="http://ftp.gnu.org/gnu/texinfo/texinfo-6.3.tar.xz"
URL_2="ftp://sourceware.org/pub/gdb/releases/gdb-7.11.1.tar.xz"
TOOLS_DIR="$2"
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi
if [ ! -d $TOOLS_DIR ]; then
    $TOOLS_DIR=$LOCAL_PATH
fi

mkdir -p gdb
pushd gdb 2>/dev/null
wget $URL_1 2>/dev/null || curl -O $URL_1
tar xf texinfo-6.3.tar.xz
pushd texinfo-6.3 2>/dev/null
./configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS
make $LOCAL_MAKEFLAGS install
popd
wget $URL_2 2>/dev/null || curl -O $URL_2
tar xf
pushd gdb-7.11.1 2>/dev/null
./configure --with-python --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS
make $LOCAL_MAKEFLAGS install

