sudo nano /etc/default/grub
GRUB_DEFAULT=0
GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=0
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash amd_iommu=on iommu=pt"
sudo update-grub
sudo update-initramfs -u

sudo apt update
sudo apt install plymouth plymouth-themes
sudo plymouth-set-default-theme spinner -R

sudo nano /etc/apt/sources.list
Add contrib non-free
sudo apt update

sudo apt install curl
curl -s 'https://liquorix.net/install-liquorix.sh' | sudo bash

sudo dpkg-reconfigure locales
