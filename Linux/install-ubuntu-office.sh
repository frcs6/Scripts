#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

mkdir ~/tmp
pushd ~/tmp

remove_libreoffice
flatpak install org.libreoffice.LibreOffice -y
#install_onlyoffice

popd
rm -rf ~/tmp
