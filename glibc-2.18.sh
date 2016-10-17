#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p gcc/glibc-2.18/{build,tmp}
curl -O http://ftp.gnu.org/gnu/libc/glibc-2.18.tar.gz
tar xf glibc-2.18.tar.gz
curl -O http://ftp.gnu.org/gnu/libc/glibc-linuxthreads-2.5.tar.bz2
tar xf glibc-linuxthreads-2.5.tar.bz2
mv linuxthreads* glibc-2.18/
pushd tmp
../glibc-2.18/configure --prefix=$LOCAL_PATH --enable-add-ons --enable-obsolete-rpc --disable-profile
make $LOCAL_MAKEFLAGS install

