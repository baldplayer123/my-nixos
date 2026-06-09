{ pkgs, lib, config, ... }:
{
	


	home.username = "bald";
	home.homeDirectory = "/home/bald";
	home.stateVersion = "26.05";



	# dotfiles
	home.file.".config/hypr/hyprland.conf".source = ./dotfiles/hyprland.conf;	

	home.packages = with pkgs; [
		
		#Hyprland
		kitty
		wofi
		wl-clipboard
		grim slurp

		# Utils
		tmux
		btop
		ranger
		zip
		unzip
		exiftool
		gdb
		which
		exegol

		# Apps
		firefox
		keepassxc
		obsidian
		gimp
		flameshot
	];


	gtk = {
		enable = true;
  		theme = {
    		name = "Adwaita-dark";
  		};
	};
}
