#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p autoconf/{build,tmp}
pushd autoconf
curl -O http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz
tar xf autoconf-2.69.tar.xz
pushd tmp
../autoconf-2.69/configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

