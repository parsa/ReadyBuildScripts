#/bin/bash
URL="http://curl.haxx.se/download/curl-7.38.0.tar.bz2"
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p curl/{build,tmp}
pushd curl/
wget $URL 2>/dev/null || curl -O $URL
tar xf curl-7.38.0.tar.bz2
pushd tmp
../curl-7.38.0/configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

