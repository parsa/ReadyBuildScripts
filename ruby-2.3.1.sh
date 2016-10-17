#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p ruby/tmp
pushd ruby/
wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz
tar xf ruby-2.3.1.tar.gz
pushd tmp
../ruby-2.3.1/configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

