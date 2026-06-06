{
	description = "Bald NixOS flake" ;
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
		disko = {
			url = "github:nix-community/disko";
			inputs.nixpkgs.follow = "nixpkgs";
		};

	};
	
	## This is going to create a configuration for our linux system 
	outputs = {self, nixpkgs, disko, ...}: {
		nixosConfiguration.laptop = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			module = [
				disko.nixosModules.disko
				./hosts/laptop/configuration.nix ## Our os configuration
				./hosts/laptop/disko.nix ## our partitioning configuration
			];

		};



	};

}
