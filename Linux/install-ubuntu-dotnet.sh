#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

sudo add-apt-repository ppa:dotnet/backports
sudo apt update

apt_install dotnet-sdk-8.0
apt_install dotnet-sdk-9.0
