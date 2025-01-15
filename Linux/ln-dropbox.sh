#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

create_symlink ~/Dropbox/Desktop ~/Desktop
create_symlink ~/Dropbox/Documents ~/Documents
create_symlink ~/Dropbox/Pictures ~/Pictures
create_symlink ~/Dropbox/Templates ~/Templates
