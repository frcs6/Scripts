#!/bin/bash

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR/common-functions.sh"

MAIL=$1

create_symlink ~/Insync/$MAIL/OneDrive/Bureau ~/Bureau
create_symlink ~/Insync/$MAIL/OneDrive/Documents ~/Documents
create_symlink ~/Insync/$MAIL/OneDrive/Images ~/Images
create_symlink ~/Insync/$MAIL/OneDrive/Templates ~/Modèles
