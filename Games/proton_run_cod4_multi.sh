#!/bin/bash

#export DXVK_HUD=1
#export DXVK_HUD=full
export PROTON_ENABLE_NVAPI=0

export STEAM_COMPAT_CLIENT_INSTALL_PATH=~/.local/share/Steam
export STEAM_COMPAT_DATA_PATH=~/Games/cod4
export PROTON_PATH=~/.local/share/Steam/compatibilitytools.d/GE-Proton7-55

cd "$STEAM_COMPAT_DATA_PATH/pfx/drive_c/MW1"
gamemoderun "$PROTON_PATH/proton" run iw3mp.exe
