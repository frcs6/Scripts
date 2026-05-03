#!/usr/bin/env bash

sudo apt update

sudo apt -t bookworm-backports install linux-image-amd64 -y
sudo apt -t bookworm-backports install libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers -y
