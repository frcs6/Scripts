#!/bin/bash

export STEAM_COMPAT_CLIENT_INSTALL_PATH=~/.local/share/Steam
export STEAM_COMPAT_DATA_PATH=~/Games/cod4
export PROTON_PATH=~/.local/share/Steam/compatibilitytools.d/GE-Proton8-32

mkdir -p ~/Games/cod4

pushd ~/Games/installer/MW1
cat cd_key.txt && echo

pushd COD4MW_EN
"$PROTON_PATH/proton" run setup.exe
popd

"$PROTON_PATH/proton" run CoD4MW-1.6-PatchSetup.exe
"$PROTON_PATH/proton" run CoD4MW-1.6-1.7-PatchSetup.exe

cp -f iw3sp.exe "$STEAM_COMPAT_DATA_PATH/pfx/drive_c/MW1/"

cp -r cod4-client-manualinstall_21.1 "$STEAM_COMPAT_DATA_PATH/pfx/drive_c/MW1"
pushd "$STEAM_COMPAT_DATA_PATH/pfx/drive_c/MW1/cod4-client-manualinstall_21.1"
"$PROTON_PATH/proton" run install.cmd
popd

popd
