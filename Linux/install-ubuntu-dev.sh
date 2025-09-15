#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

mkdir ~/tmp
pushd ~/tmp

sudo snap install --classic code

sudo add-apt-repository ppa:dotnet/backports
sudo apt update
sudo apt install dotnet-sdk-8.0 -y
sudo apt install dotnet-sdk-9.0 -y

popd
rm -rf ~/tmp
