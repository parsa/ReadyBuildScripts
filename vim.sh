#/bin/bash

export COMPILED_BY="Parsa Amini <me@parsaamini.net>"

# Check if you have ruby before you start this script
if [ ! -d $LOCAL_PATH ]; then
    echo "Install directory doesn't exist"
    exit 1
fi
if [[ -z PYTHON_ROOT ]]; then
    export PYTHON_ROOT=dirname `which python`
fi
export PYTHON_CONFIG=$(readlink -f $PYTHON_ROOT/../lib/python2.7/config)
if [ ! -d $PYTHON_CONFIG ]; then
    echo "Cannot find python config directory"
    exit 1
fi
mkdir vim
pushd vim

git clone https://github.com/vim/vim.git vim
#wget -O vim.tgz https://github.com/vim/vim/archive/v8.0.0017.tar.gz
#tar xf vim.tgz
#mv vim-* vim

pushd vim
./configure --with-features=huge                     \
            --enable-cscope                          \
            --enable-luainterp                       \
            --enable-pythoninterp                    \
            --with-python-config-dir=$PYTHON_CONFIG  \
            --enable-rubyinterp                      \
            --enable-multibyte                       \
            --enable-gui=auto                        \
            --with-x                                 \
            --enable-fontset                         \
            --enable-gnome-check                     \
            --enable-gtk2-check                      \
            --with-compiledby=$COMPILED_BY           \
            --prefix=$LOCAL_PATH                     \

make $LOCAL_MAKEFLAGS                          \
     VIMRUNTIMEDIR=$LOCAL_PATH/share/vim/vim80 \
     VIM=$LOCAL_PATH/etc                       \

make $LOCAL_MAKEFLAGS install

mkdir -p ~/.vim/{undo,bkp,swp}
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
pushd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer
#./install.sh --clang-completer --system-libclang --system-boost
pushd ~/.vim/bundle/command-t/ruby/command-t && ruby extconf.rb && make
# Debian
#Huge version without GUI.  Features included (+) or not (-):
#+acl             +cmdline_info    +emacs_tags      -hangul_input    +menu            +mouse_xterm     -python3         +syntax          +virtualedit     -xsmp
#+arabic          +comments        +eval            +iconv           +mksession       +multi_byte      +quickfix        +tag_binary      +visual          -xterm_clipboard
#+autocmd         +conceal         +ex_extra        +insert_expand   +modify_fname    +multi_lang      +reltime         +tag_old_static  +visualextra     -xterm_save
#-balloon_eval    +cryptv          +extra_search    +jumplist        +mouse           -mzscheme        +rightleft       -tag_any_white   +viminfo         -xpm
#-browse          +cscope          +farsi           +keymap          -mouseshape      +netbeans_intg   +ruby            +tcl             +vreplace
#++builtin_terms  +cursorbind      +file_in_path    +langmap         +mouse_dec       +path_extra      +scrollbind      +terminfo        +wildignore
#+byte_offset     +cursorshape     +find_in_path    +libcall         +mouse_gpm       +perl            +signs           +termresponse    +wildmenu
#+cindent         +dialog_con      +float           +linebreak       -mouse_jsbterm   +persistent_undo +smartindent     +textobjects     +windows
#-clientserver    +diff            +folding         +lispindent      +mouse_netterm   +postscript      -sniff           +title           +writebackup
#-clipboard       +digraphs        -footer          +listcmds        +mouse_sgr       +printer         +startuptime     -toolbar         -X11
#+cmdline_compl   -dnd             +fork()          +localmap        -mouse_sysmouse  +profile         +statusline      +user_commands   -xfontset
#+cmdline_hist    -ebcdic          +gettext         +lua             +mouse_urxvt     +python          -sun_workshop    +vertsplit       -xim
#   system vimrc file: "$VIM/vimrc"
#     user vimrc file: "$HOME/.vimrc"
# 2nd user vimrc file: "~/.vim/vimrc"
#      user exrc file: "$HOME/.exrc"
#  fall-back for $VIM: "/usr/share/vim"
#Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H     -g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1     -I/
#usr/include/tcl8.5  -D_REENTRANT=1  -D_THREAD_SAFE=1  -D_LARGEFILE64_SOURCE=1
#Linking: gcc   -L. -Wl,-z,relro -rdynamic -Wl,-export-dynamic -Wl,-E  -Wl,-z,relro -Wl,--as-needed -o vim        -lm -ltinfo -lnsl  -lselinux  -lacl -lattr -lgpm -ldl  -L/usr/lib -l
#lua5.1 -Wl,-E  -fstack-protector -L/usr/local/lib  -L/usr/lib/perl/5.18/CORE -lperl -ldl -lm -lpthread -lcrypt -L/usr/lib/python2.7/config-x86_64-linux-gnu -lpython2.7 -lpthread -ld
#l -lutil -lm -Xlinker -export-dynamic -Wl,-O1 -Wl,-Bsymbolic-functions  -L/usr/lib -ltcl8.5 -ldl -lpthread -lieee -lm -lruby-1.9.1 -lpthread -lrt -ldl -lcrypt -lm  -L/usr/lib
