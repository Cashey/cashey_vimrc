#!/bin/bash

cd "`dirname $0`"

SCRIPT_HOME=`pwd`

cd ~
mkdir -p oldvim/
tar zcvf oldvim/vim_vimrc_bashrc_bak_`date +%s`.tgz .vim .vimrc .barhc 2> /dev/null

tar -xvf "${SCRIPT_HOME}/vimrc.tgz"
echo 'PATH="${PATH}:'`bash -c "echo ~/.vim/scripts"`'"' >> .bashrc

