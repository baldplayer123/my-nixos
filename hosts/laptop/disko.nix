{
	disko.devices = {
		disk = {
			main_disk = {
				## Change this to the physical disk you are going to use !
				device = "/dev/sda";
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

						swap = {
							size = 	"8G";
							content = {
								type = "swap";
								discardPolicy = "both"; ## Means once and pages, so at startup, clean partition and if pages is freed, clean partitions
							};
						};

						root = {
						 size = "100%";
						 content = {
						 	type = "btrfs";
							extraArgs = ["-f"];
							subVolumes = {
								"@" = {
									mountpoint = "/";
									mountOptions = [ "compress=zstd" "noatime"];
								};
	
								"@home" = {
									mountpoint = "/home";
									mountOptions = [ "compress=zstd" "noatime"];
								};

								"@nix" = {
									mountpoint = "/nix";
									mountOptions = [ "compress=zstd" "noatime"];
								};

								"@var" = {
									mountpoint = "/var";
									mountOptions = [ "compress=zstd" "noatime"];
								};

							};



						 };

						};


					};


				};


			};

		};

	}
}
