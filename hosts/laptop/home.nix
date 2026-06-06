{ pkgs, lib, ... }:
{
	home.username = "bald";
	home.homeDirectory = "/home/bald";
	home.stateVersion = "26.05";

	home.packages = with pkgs; [
		# Utils
		tmux
		btop
		ranger
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
