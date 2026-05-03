#!/usr/bin/env bash

sudo apt update

sudo apt -t trixie-backports install linux-image-amd64 -y
sudo apt -t trixie-backports install libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers -y
