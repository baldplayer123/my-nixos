{ config, pkgs, ...}:

{
	imports = [ 
		./hardware-configuration.nix 
	];


	# Bootloader configuration
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.initrd.systemd.enable = true;

	# Networking
	networking.hostName = "laptop";
	networking.networkmanager.enable = true;

	# Locale
	time.timeZone = "Europe/Paris";
	i18n.defaultLocale = "fr_FR.UTF-8";
	console.keyMap = "fr";

	#Font
	fonts.fontconfig.defaultFonts.monospace = [ "Source Code Pro" ];

	# Programs
	programs.zsh.enable = true;

	#users
	users.users.root.hashedPassword = "!";
	users.users.bald = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" "video" "audio"];
		shell = pkgs.zsh;
		initialPassword = "changeme";
	};

	# Graphic env
	services.displayManager.ly.enable = true;
	programs.hyprland.enable = true;

	## Audio
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	## Bluetooth
	hardware.bluetooth = {
  	enable = true;
  	powerOnBoot = true;
	};


	## SystemPackages
	environment.systemPackages = with pkgs; [
		vim
		curl
		wget
		git
	];


	## Nix configuration
	nix.settings = {
		experimental-features = ["nix-command" "flakes"];

	};

	system.stateVersion = "26.05";














}
