# Start partitioning 
```
nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode disko --flake github:baldplayer123/my-nixos#laptop
```

# Start install
```
nixos-install --root /mnt --flake github:baldplayer123/my-nixos#laptop --no-root-password
```
