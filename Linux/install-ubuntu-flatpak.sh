#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

mkdir ~/tmp
pushd ~/tmp

sudo apt update

flatpak install com.github.tchx84.Flatseal -y
flatpak install org.keepassxc.KeePassXC -y
flatpak install org.gimp.GIMP -y
flatpak install org.videolan.VLC -y

popd
rm -rf ~/tmp
