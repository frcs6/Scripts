#!/usr/bin/env bash

sudo apt update

sudo apt -t trixie-backports install linux-image-amd64 -y

# ThinkPad E16
# sudo apt -t trixie-backports install \
#   libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers \
#   firmware-amd-graphics libva2 libgl1 \
#   mesa-va-drivers mesa-vdpau-drivers -y

# Yoga 13
# sudo apt -t trixie-backports install \
#   libgl1-mesa-dri libglx-mesa0 libgl1 \
#   intel-media-va-driver-non-free libva2 \
#   mesa-va-drivers mesa-vdpau-drivers -y

# Aspire 5
# sudo apt -t trixie-backports install \
#   libgl1-mesa-dri libglx-mesa0 mesa-vulkan-drivers \
#   intel-media-va-driver-non-free libva2 libgl1 \
#   mesa-va-drivers mesa-vdpau-drivers -y

# VMware Workstation
# sudo apt -t trixie-backports install \
#   libgl1-mesa-dri libglx-mesa0 libgl1 \
#   mesa-utils open-vm-tools-desktop -y
