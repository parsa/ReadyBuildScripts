if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#source /usr/local/packages/compilers/Intel/parallel_studio_xe_2015/composer_xe_2015.0.090/bin/compilervars.sh intel64
#source /usr/local/packages/compilers/Intel/parallel_studio_xe_2015/composer_xe_2015.0.090/bin/debuggervars.sh intel64

#module unload intel
#module load boost

#source  /usr/local/packages/compilers/Intel/parallel_studio_xe_2016_u3/bin/compilervars.sh intel64
#source /usr/local/compilers/Intel/parallel_studio_xe_2016_u3/compilers_and_libraries_2016.3.210/linux/mpi/intel64/bin/mpivars.sh

#module load intel/15.0.0
#VARIANT=release
#VARIANT=profile
#VARIANT=glibcxx_debug
#VARIANT=debug
#source /usr/local/compilers/Intel/parallel_studio-2015u3/bin/compilervars.sh intel64
#module load gcc
#module load cmake
#module load hwloc/1.10.0/INTEL-14.0.2
#module load python/2.7.7-anaconda
#source /usr/local/compilers/Intel/parallel_studio-2015u3/impi/5.0.3.048/intel64/bin/mpivars.sh



#export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$HOME/$VARIANT/lib/pkgconfig
#export SINK_LD_LIBRARY_PATH=/usr/local/compilers/Intel/parallel_studio_xe_2015/composer_xe_2015.0.090/compiler/lib/mic/:/work/dmarce1/mic/hpx/lib/:/usr/local/packages/boost/1.55.0/INTEL-14.0.2-python-2.7.7-anaconda-mic/lib/:/usr/local/packages/hwloc/1.10.0/INTEL-14.0.2-mic/lib:/usr/local/compilers/Intel/parallel_studio_xe_2015/impi/5.0.1.035/mic/lib:$SINK_LD_LIBRARY_PATH
module unload gcc
module unload boost
module unload intel
module unload cmake

#module unload boost
