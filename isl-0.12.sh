#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p gcc/isl-0.12/{build,tmp}
pushd gcc/isl-0.12
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.12.2.tar.bz2
tar xf isl-0.12.2.tar.bz2
pushd tmp
../isl-0.12.2/configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

