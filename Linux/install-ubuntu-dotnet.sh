#!/usr/bin/env bash

sudo add-apt-repository ppa:dotnet/backports
sudo apt update
sudo apt install dotnet-sdk-8.0 -y
sudo apt install dotnet-sdk-9.0 -y
