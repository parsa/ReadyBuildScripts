#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p m4/{build,tmp}
pushd m4
curl -O http://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.xz
tar xf m4-1.4.17.tar.xz
pushd tmp
../m4-1.4.17/configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

