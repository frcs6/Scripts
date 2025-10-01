# Linux post installation

## Configure 

- Google Chrome
- Dropbox ou OneDrive
- Configure Online Account
- Add language in Libre Office
- Timeshift

## RClone - auto-start command

`rclone --config /home/frcs6/.config/rclone/rclone.conf --vfs-cache-mode writes mount --daemon "OneDrive": /home/frcs6/OneDrive`
(Add 30 seconds of delay on Mint)
