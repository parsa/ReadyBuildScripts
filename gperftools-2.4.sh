#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi
LIBUNWIND="$2"
if [ ! -d $LIBUNWIND ]; then
    echo "Path to libunwind is not specified or is incorrect."
    exit 1
fi

mkdir -p gperftools/build
pushd gperftools
wget --no-check-certificate --content-disposition https://googledrive.com/host/0B6NtGsLhIcf7MWxMMF9JdTN3UVk/gperftools-2.4.tar.gz
tar xf gperftools-2.4.tar.gz
pushd gperftools-2.4
# --with-libunwind=$LOCAL_PATH should work, but it doesn't
./configure --prefix=$LOCAL_PATH LDFLAGS=-L$LIBUNWIND/lib C_INCLUDE_PATH=$LIBUNWIND/include/ CPLUS_INCLUDE_PATH=$LIBUNWIND/include/
LDFLAGS=-L$LIBUNWIND/lib C_INCLUDE_PATH=$LIBUNWIND/include/ CPLUS_INCLUDE_PATH=$LIBUNWIND/include/ make $LOCAL_MAKEFLAGS install

