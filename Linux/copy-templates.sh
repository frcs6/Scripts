#!/bin/bash

src="./Templates"
dest="$HOME/Templates"

mkdir -p "$dest"

for file in "$src"/*; do
    filename=$(basename "$file")
    if [ ! -e "$dest/$filename" ]; then
        echo "Copie de $filename vers $dest"
        cp "$file" "$dest/"
    else
        echo "$filename déjà présent dans $dest, aucune copie."
    fi
done

