{
	description = "Bald NixOS flake" ;
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";

		};

	};
	
	## This is going to create a configuration for our linux system 
	outputs = {self, nixpkgs, disko, home-manager, ...}: {
		nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./hosts/laptop/configuration.nix ## Our os configuration
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.bald = import ./hosts/laptop/home.nix;

				}
			];

		};



	};

}
