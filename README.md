# NixOS Install Guide (disko + flake)

---

## 1. Boot the installer
Boot the machine from the NixOS installer USB.

---

## 2. Connect to the internet
```bash
nmti or ethernet  
```

---

## 3. Enable flakes for this shell
The installer disables flakes by default, so turn them on for this session.

```bash
export NIX_CONFIG="experimental-features = nix-command flakes"
```

---

## 4. Get the flake
Clone your config repo into the live environment.

```bash
nix-shell -p git --run "git clone https://github.com/YOURNAME/my-nixos.git"
cd my-nixos
```

---

## 5. Find and set the target disk
List disks, pick the correct disk

```bash
lsblk
vim  hosts/laptop/disko.nix   # replace CHANGE-ME with your disk
```

---

## 6. Partition, format, and mount (ERASES THE DISK)
disko reads your layout and sets up the disk, mounting everything under /mnt.

```bash
sudo nix --extra-experimental-features "nix-command flakes" run \
  github:nix-community/disko/latest -- \
  --mode destroy,format,mount \
  --flake .#laptop
```

---

## 7. Generate the real hardware config
Replace the placeholder with this machine's actual hardware scan (no filesystems — disko owns those).

```bash
sudo nixos-generate-config --no-filesystems --root /mnt
cp /mnt/etc/nixos/hardware-configuration.nix hosts/laptop/hardware-configuration.nix
```

---

## 8. Install
Build and install the whole system onto the mounted disk.

```bash
sudo nixos-install --flake .#laptop
```

---

## 9. Reboot
Remove the USB and boot into your new system.

```bash
reboot
```

---

## 10. First login
Log in as `bald` / `changeme`, then change your password right away.

```bash
passwd
```

---

