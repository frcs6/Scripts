#!/bin/bash

export WINEPREFIX=~/Games/prefixes/cod4
export WINEARCH=win32

winetricks settings win10
winetricks corefonts d3dx9 vcrun2005 dxvk

pushd ~/Games/installer/MW1
cat cd_key.txt && echo

pushd COD4MW_EN
wine setup.exe
popd

wine CoD4MW-1.6-PatchSetup.exe
wine CoD4MW-1.6-1.7-PatchSetup.exe

cp -f iw3sp.exe "$WINEPREFIX/drive_c/MW1/"

cp -r cod4-client-manualinstall_21.1 "$WINEPREFIX/drive_c/MW1"
pushd "$WINEPREFIX/drive_c/MW1/cod4-client-manualinstall_21.1"
wine install.cmd
popd

popd
