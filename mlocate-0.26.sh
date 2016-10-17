#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

curl -O https://fedorahosted.org/releases/m/l/mlocate/mlocate-0.26.tar.xz
tar xf tar xf mlocate-0.26.tar.xz
pushd mlocate-0.26
./configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS
make install

