# LVM + LUKS

## Warning: Devices have inconsistent logical block sizes (512 and 4096).

```
sudo xed /etc/lvm/lvm.conf

  allow_mixed_block_sizes = 1
```

## Find volume

```
sudo lvdisplay
--- Logical volume ---
  LV Path                /dev/vgmint/root
  LV Name                root
  VG Name                vgmint
```

## Extend volume

```
sudo fdisk /dev/sdb
sudo cryptsetup luksFormat /dev/sdb1
sudo cryptsetup open /dev/sdb1 sdb1_crypt
sudo pvcreate /dev/mapper/sdb1_crypt
sudo vgextend vgmint /dev/mapper/sdb1_crypt
sudo lvextend -l +100%FREE /dev/vgmint/root
sudo resize2fs /dev/vgmint/root
```

## Fix boot

```
sudo blkid /dev/sdb1
sudo nano /etc/crypttab

  dm_crypt-0 UUID=2bced663-cfea-4f47-acdc-7510d6bc7263 none luks,keyscript=decrypt_keyctl
  dm_crypt-1 UUID=35f89679-9f0f-4af2-9105-9b7ca408fa88 none luks,keyscript=decrypt_keyctl

sudo update-initramfs -u
```
