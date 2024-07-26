# Linux post installation

## Configure 

- Ubuntu Pro
- Google Chrome
- Dropbox + Scripts `ln-dropbox.sh`
- Configure Spofity
- Configure Gnome Online Account
- Add language in Libre Office
- Timeshift

## Extensions Gnome

- caffeine
- gamemode shell extension

## Others

- Dual boot Windows: `timedatectl set-local-rtc 1 --adjust-system-clock`
- Samba v1: https://askubuntu.com/questions/1265923/configuring-20-04-samba-for-smbv1
- Ubuntu Pro: https://ubuntu.com/pro/dashboard
- Move 'Downloads': `ln -s /data/Frcs6/Downloads ~/Downloads`

## RClone - auto-start command

`rclone --config /home/frcs6/.config/rclone/rclone.conf --vfs-cache-mode writes mount --daemon "OneDrive": /home/frcs6/OneDrive`
(Add 30 seconds of delay on Mint)

## ASUS Camera

```
sudo apt install qv4l2
nano /etc/environment
LD_PRELOAD=/lib/x86_64-linux-gnu/libv4l/v4l1compat.so
```
