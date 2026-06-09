{
	description = "Bald NixOS flake" ;
	
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

		disko = {
		  url = "github:nix-community/disko";
		  inputs.nixpkgs.follows = "nixpkgs";
		};

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
				disko.nixosModules.disko
				./hosts/laptop/disko.nix
				./hosts/laptop/configuration.nix
				home-manager.nixosModules.home-manager {
				        home-manager.useGlobalPkgs = true;
				        home-manager.useUserPackages = true;
				        home-manager.users.bald = import ./hosts/laptop/home.nix;
				      }

			];

		};



	};

}
