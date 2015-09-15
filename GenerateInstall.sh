#!/bin/bash

HOME_DIR=$(cd `dirname $0` && pwd)
INSTALLER_DIR="${HOME_DIR}/Installer"
SRC_DIR="${HOME_DIR}/src"

mkdir -p ${INSTALLER_DIR}

cd ${SRC_DIR} \
&& tar zcf vimrc.tgz .vim .vimrc \
&& mkdir -p cashey_vimrc \
&& cp vimrc.tgz Install.sh cashey_vimrc \
&& tar zcf ${INSTALLER_DIR}/cashey_vimrc_install.tgz cashey_vimrc \
&& rm -rf cashey_vimrc

if [[ $? -eq 0 ]]
then
    echo "Installer successfully packed:"
    echo "  ${INSTALLER_DIR}/cashey_vimrc_install.tgz"
else
    echo "Installer pack failed."
fi
