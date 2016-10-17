#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p cmake/{build,tmp}
pushd cmake/
curl -O http://www.cmake.org/files/v2.8/cmake-2.8.12.2.tar.gz
tar xf cmake-2.8.12.2.tar.gz
pushd tmp
../cmake-2.8.12.2/configure --prefix=$LOCAL_PATH --parallel=$PROCESSOR_COUNT

