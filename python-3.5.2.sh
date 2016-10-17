#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p python3/{build,tmp}
pushd python3/
curl -O https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz
tar xf Python-3.5.2.tgz
pushd tmp
../Python-3.5.2/configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

