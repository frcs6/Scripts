#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

if command -v apt >/dev/null 2>&1; then
    sudo add-apt-repository ppa:dotnet/backports
    sudo apt update

    apt_install dotnet-sdk-8.0
    apt_install dotnet-sdk-9.0
    #apt_install dotnet-sdk-10.0
fi

if command -v snap >/dev/null 2>&1; then
    snap_install code --classic
    snap_install rider --classic
fi
