#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

FOLDER=$1

create_symlink ~/$FOLDER/Desktop ~/Bureau
create_symlink ~/$FOLDER/Documents ~/Documents
create_symlink ~/$FOLDER/Pictures ~/Images
create_symlink ~/$FOLDER/Templates ~/Modèles
create_symlink ~/$FOLDER/Music ~/Musique
create_symlink ~/$FOLDER/Videos ~/Vidéos
