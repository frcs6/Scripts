#!/bin/bash

if ! command -v apt >/dev/null 2>&1; then
    echo "Not a Debian-based system — script ignored."
    exit 0
fi

sudo apt install build-essential dkms git iw -y
mkdir ~/Drivers
pushd ~/Drivers
git clone https://github.com/morrownr/8821au-20210708.git
pushd ./8821au-20210708
sudo ./install-driver.sh
popd
popd
