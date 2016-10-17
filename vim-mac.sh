#!/usr/bin/env bash

#git clone https://github.com/vim/vim.git vim

pushd vim
# Environment variables
#export SFW='/System/Library/Frameworks'
#export AFW='.framework/Versions/A/Frameworks'
#export HFW='Versions/A/Headers'

#export CXX=/usr/local/opt/llvm/bin/clang++
#export CC=/usr/local/opt/llvm/bin/clang
#export CPATH="$CPATH:"                                            \
#             "$SFW/Carbon$AFW/CarbonSound.framework/$HFW:"        \
#             "$SFW/Carbon$AFW/HIToolbox.framework/$HFW:"          \
#             "$SFW/CoreServices$AFW/CarbonCore.framework/$HFW:"   \
#             "$SFW/ApplicationServices$AFW/QD.framework/$HFW:"    \
#             "/usr/include/sys"                                   \

#export CPPFLAGS=""\
                #"-I$SFW/Carbon$AFW/CarbonSound.framework/$HFW "       \
                #"-I$SFW/Carbon$AFW/HIToolbox.framework/$HFW "         \
                #"-I$SFW/CoreServices$AFW/CarbonCore.framework/$HFW "  \
                #"-I$SFW/ApplicationServices$AFW/QD.framework/$HFW "   \
                #"-I/usr/include/sys "                                 \
                #--enable-gnome-check                                  \
                #--enable-gtk2-check                                   \
                #--with-x                                              \
                #--enable-pythoninterp                                 \
                #--with-python-config-dir=$PYTHON_CFG_DIR              \

export PYTHON_CFG_DIR='/usr/local/Cellar/python3/3.5.2_1/Frameworks' \
               '/Python.framework/Versions/3.5/lib/python3.5/config-3.5m'
#export PYTHON_CFG_DIR='/usr/local/Cellar/python/2.7.12/Frameworks' \
#               '/Python.framework/Versions/2.7/lib/python2.7/config'

./configure --with-features=huge                                \
            --enable-cscope                                     \
            --enable-luainterp                                  \
            --enable-python3interp                              \
            --with-python3-config-dir=$PYTHON_CFG_DIR           \
            --enable-rubyinterp                                 \
            --enable-multibyte                                  \
            --enable-gui=no                                     \
            --enable-fontset                                    \
            --prefix=/Users/parsa/Desktop/vim/binaries          \

#make farsi
make VIMRUNTIMEDIR=/Users/parsa/Desktop/vim/binaries/share/vim/vim74 \
     VIM=/Users/parsa/Desktop/vim/binaries
make install
