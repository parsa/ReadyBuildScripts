#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p automake/{build,tmp}
pushd automake
curl -O http://ftp.gnu.org/gnu/automake/automake-1.15.tar.xz
tar xf automake-1.15.tar.xz
pushd tmp
../automake-1.15/configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

