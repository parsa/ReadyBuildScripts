#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p libtool/{build,tmp}
pushd libtool
curl -O http://ftp.gnu.org/gnu/libtool/libtool-2.4.tar.xz
tar xf libtool-2.4.tar.xz
pushd tmp
../libtool-2.4/configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

