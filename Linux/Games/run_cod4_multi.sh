#!/bin/bash

#export DXVK_HUD=1
#export DXVK_HUD=full
export WINEPREFIX=~/Games/prefixes/cod4

cd "$WINEPREFIX/drive_c/MW1"
gamemoderun wine iw3mp.exe
