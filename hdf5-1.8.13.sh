#/bin/bash
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi

mkdir -p hdf5/{build,tmp}
pushd hdf5
curl -O http://www.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.8.13.tar.bz2
tar xf hdf5-1.8.13.tar.bz2
pushd tmp
#../hdf5-1.8.13/configure --enable-threadsafe --with-pthread=DIR
../hdf5-1.8.13/configure --prefix=$LOCAL_PATH
make $LOCAL_MAKEFLAGS install

