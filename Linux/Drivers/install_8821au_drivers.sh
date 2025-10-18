#!/bin/bash

sudo apt install build-essential dkms git iw -y
mkdir ~/Drivers
pushd ~/Drivers
git clone https://github.com/morrownr/8821au-20210708.git
pushd ./8821au-20210708
sudo ./install-driver.sh
popd
popd
