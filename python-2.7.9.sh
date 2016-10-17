#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p python/tmp
pushd python/
wget https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz
tar xf Python-2.7.9.tgz
pushd tmp
../Python-2.7.9/configure --enable-shared --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

