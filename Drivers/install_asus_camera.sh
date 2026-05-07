#!/bin/bash

if ! command -v apt >/dev/null 2>&1; then
    echo "Not a Debian-based system — script ignored."
    exit 0
fi

sudo apt install qv4l2 -y
echo "LD_PRELOAD=/lib/x86_64-linux-gnu/libv4l/v4l1compat.so" | sudo tee -a /etc/environment
