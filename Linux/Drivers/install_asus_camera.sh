#!/bin/bash

sudo apt install qv4l2 -y
echo "LD_PRELOAD=/lib/x86_64-linux-gnu/libv4l/v4l1compat.so" | sudo tee -a /etc/environment
