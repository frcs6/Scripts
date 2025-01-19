# Linux post installation

## Configure 

- Google Chrome
- Dropbox ou OneDrive
- Configure Spofity
- Configure Gnome Online Account
- Add language in Libre Office
- Timeshift
- Adjust swap size

## Others

- Dual boot Windows: `timedatectl set-local-rtc 1 --adjust-system-clock`
- Samba v1: https://askubuntu.com/questions/1265923/configuring-20-04-samba-for-smbv1
- Ubuntu Pro: https://ubuntu.com/pro/dashboard
- [LVM + LUKS](LVM.md)

## RClone - auto-start command

`rclone --config /home/frcs6/.config/rclone/rclone.conf --vfs-cache-mode writes mount --daemon "OneDrive": /home/frcs6/OneDrive`
(Add 30 seconds of delay on Mint)
