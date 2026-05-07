#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

FOLDER=$1

create_symlink ~/$FOLDER/Desktop ~/Desktop
create_symlink ~/$FOLDER/Documents ~/Documents
create_symlink ~/$FOLDER/Pictures ~/Pictures
create_symlink ~/$FOLDER/Templates ~/Templates
create_symlink ~/$FOLDER/Music ~/Music
create_symlink ~/$FOLDER/Videos ~/Videos
