#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 0
fi

mkdir ninja
pushd ninja
curl -L -O https://github.com/martine/ninja/archive/v1.5.3.tar.gz
tar xf ninja-1.5.3.tar.gz
pushd ninja-1.5.3
# DEPRECATED:
#./bootstrap.py
./configure.py --bootstrap
cp ninja $LOCAL_PATH/bin/

