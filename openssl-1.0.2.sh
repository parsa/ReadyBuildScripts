#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p openssl
pushd openssl
wget https://www.openssl.org/source/openssl-1.0.2.tar.gz
tar xf openssl-1.0.2.tar.gz
pushd openssl-1.0.2
./config --prefix=$LOCAL_PATH shared
make $LOCAL_MAKEFLAGS
make $LOCAL_MAKEFLAGS install

