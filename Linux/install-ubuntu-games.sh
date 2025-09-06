#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

mkdir ~/tmp
pushd ~/tmp

#steam
flatpak install com.heroicgameslauncher.hgl -y
flatpak install net.lutris.Lutris -y

popd
rm -rf ~/tmp
