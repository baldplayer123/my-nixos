{ pkgs, lib, config, ... }:
{
	


	home.username = "bald";
	home.homeDirectory = "/home/bald";
	home.stateVersion = "26.05";



	# dotfiles
	home.file.".config/sway".source = ./dotfiles/sway;	

	home.packages = with pkgs; [
		
		#Hyprland
		kitty
		wofi
		waybar
		swaybg # Wallpaper
		mako
		wl-clipboard
		brightnessctl
		flameshot
				

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


	#Flamesot config
	services.flameshot = {
		enable = true;
			settings = {
				General = {
					useGrimAdapter = true;
					#disabledGrimWarning = true;
				};
			};
	};

	xdg.configFile."flameshot/flameshot.ini".text = ''
		[General]
		useGrimAdapter=true
	'';

}
