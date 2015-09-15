#!/bin/bash

HOME_DIR=$(cd `dirname $0` && pwd)
INSTALLER_DIR="${HOME_DIR}/Installer"
SRC_DIR="${HOME_DIR}/src"

mkdir -p ${INSTALLER_DIR}

cd ${SRC_DIR} \
&& tar zcvf vimrc.tgz .vim .vimrc \
&& tar zcvf ${INSTALLER_DIR}/cashey_vimrc_install.tgz vimrc.tgz Install.sh

if [[ $? -eq 0 ]]
then
    echo "Installer successfully packed."
else
    echo "Installer pack failed."
fi
