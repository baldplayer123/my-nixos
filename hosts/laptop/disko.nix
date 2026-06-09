{
  disko.devices = {
    disk = {
      main = {
        device = "/dev/disk/by-id/CHANGE-ME";  # you'll set this in Phase 2
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              priority = 1;
              type = "EF00";
              size = "1G";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "@root" = { mountpoint = "/";     mountOptions = [ "compress=zstd" "noatime" ]; };
                  "@home" = { mountpoint = "/home"; mountOptions = [ "compress=zstd" "noatime" ]; };
                  "@nix"  = { mountpoint = "/nix";  mountOptions = [ "compress=zstd" "noatime" ]; };
                  "@var"  = { mountpoint = "/var";  mountOptions = [ "compress=zstd" "noatime" ]; };
                  "@swap" = { mountpoint = "/swap"; swap.swapfile.size = "8G"; };
                };
              };
            };
          };
        };
      };
    };
  };
}
