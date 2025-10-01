#!/bin/bash

create_symlink() {
  local TARGET_PATH=$1
  local LINK_PATH=$2
  if [ -d "$TARGET_PATH" ]; then
    if [ -L "$LINK_PATH" ]; then
      echo "$LINK_PATH is already a symbolic link"
      rm "$LINK_PATH"
    else
      echo "$LINK_PATH is not a symbolic link"
      rm -rf "$LINK_PATH"
    fi
    ln -s "$TARGET_PATH" "$LINK_PATH"
    echo "Created symlink: $LINK_PATH -> $TARGET_PATH"
  else
    echo "Target directory does not exist: $TARGET_PATH"
  fi
}
