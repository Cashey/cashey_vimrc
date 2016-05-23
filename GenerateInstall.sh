#!/bin/bash

HOME_DIR=$(cd `dirname $0` && pwd)
INSTALLER_DIR="${HOME_DIR}/Installer"
SRC_DIR="${HOME_DIR}/src"

mkdir -p ${INSTALLER_DIR}

cd ${SRC_DIR} \
&& tar zcf vimrc.tgz .vim .vimrc \
&& mkdir -p install_vimrc \
&& cp vimrc.tgz Install.sh install_vimrc \
&& tar zcf ${INSTALLER_DIR}/install_vimrc.tgz install_vimrc \
&& rm -rf install_vimrc

if [[ $? -eq 0 ]]
then
    echo "Installer successfully packed:"
    echo "  ${INSTALLER_DIR}/install_vimrc.tgz"
else
    echo "Installer pack failed."
fi
