{ config, pkgs, ...}:

{
	imports = [ ./hardware-configuration.nix];


	# Bootloader configuration
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	# Networking
	networking.hostName = "laptop";
	networking.networkmanager.enable = true;

	# Locale
	time.timeZone = "Europe/Paris";
	i18n.defaultLocale = "fr_FR.UTF-8";
	console.keyMap = "fr";

	# Programs
	programs.zsh.enable = true;

	#users
	users.mutableUsers = false;
	users.users.root.hashedPassword = "!";
	users.users.bald = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" "video" "audio"];
		shell = pkgs.zsh;
		initialPassword = changeme;
	};

	# Services
	services.xserver.enable = true;
	services.displayManager.ly.enable = true;
	services.desktopManager.gnome.enable = true;

	## Audio
	hardware.pulseaudio.enable = false;
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
