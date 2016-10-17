#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p isl-0.11/{build,tmp}
pushd isl-0.11
curl -O ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-0.11.1.tar.bz2
tar xf isl-0.11.1.tar.bz2
pushd tmp
../isl-0.11.1/configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

