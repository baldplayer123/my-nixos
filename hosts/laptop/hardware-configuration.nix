{ config, lib, modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # PLACEHOLDER ONLY — lets the flake evaluate so disko can run.
  # Overwritten during install by the real hardware scan (see INSTALL.md, step 6).
  boot.initrd.availableKernelModules = [ ];
  boot.kernelModules = [ ];
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
