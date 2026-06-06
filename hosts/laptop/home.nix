{ pkgs, lib, ... }:
{
	home.username = "bald";
	home.homeDirectory = "/home/bald";
	home.stateVersion = "26.05";

	home.packages = with pkgs; [
		tmux
		btop
	];
}
