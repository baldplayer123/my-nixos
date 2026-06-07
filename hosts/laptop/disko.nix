{ ... }:
{
	disko.devices = {
		disk = {
			main_disk = {
				## Change this to the physical disk you are going to use !
				device = "/dev/nvme0n1";
				type = "disk";
				content = {
					type = "gpt" ;
					partitions = {
						ESP = {
							type = "EF00";
							size = "500M";
							content = {
								type = "filesystem";
								format = "vfat";
								mountpoint = "/boot";
								mountOptions = [ "umask=0077"]; ## Means only owner has right, so in our case, root.
							};
						};

						luks = {
							size = "100%";
							content = {
								type = "luks";
								name = "crypted";
								settings = {
									allowDiscards = true;
								};
								content = {
									type = "btrfs";
									extraArgs = [ "-f" ];
									subvolumes = {
										"@root" = {
											mountpoint = "/";
											mountOptions = ["compress=zstd" "noatime"];
										};
										"@persist" = {
											mountpoint = "/persist";
											mountOptions = ["compress=zstd" "noatime"];
										};
										"@nix" = {
											mountpoint = "/nix";
											mountOptions = ["compress=zstd" "noatime"];
										};
										"@swap" = {
											mountpoint = "/swap";
											swap.swapfile.size = "8G";
										};
										"@var" = {
											mountpoint = "/var";
											mountOptions = ["compress=zstd" "noatime"];
										};
									};
								};
							};


						};

					};


				};


			};

		};

	};
}
