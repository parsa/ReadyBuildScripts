#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p gcc/glibc-2.23/{build,tmp}
curl -O http://ftp.gnu.org/gnu/libc/glibc-2.23.tar.gz
tar xf glibc-2.23.tar.gz
pushd tmp
../glibc-2.23/configure --prefix=$LOCAL_PATH --enable-add-ons --enable-obsolete-rpc --disable-profile
make $LOCAL_MAKEFLAGS install

