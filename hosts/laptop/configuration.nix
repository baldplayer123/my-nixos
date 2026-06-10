{ config, pkgs, ...}:

{
	imports = [ 
		./hardware-configuration.nix 
	];

	# Bootloader configuration
	boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.configurationLimit = 10;
	boot.loader.efi.canTouchEfiVariables = true;

	# Networking
	networking.hostName = "laptop";
	networking.networkmanager.enable = true;

	# Locale
	time.timeZone = "Europe/Paris";
	i18n.defaultLocale = "fr_FR.UTF-8";
	console.keyMap = "fr";

    fonts.packages = with pkgs; [
        font-awesome_4
        nerd-fonts.symbols-only
        nerd-fonts.jetbrains-mono
    ];


	# Programs
	programs.zsh.enable = true;

	# Virtualisation
	virtualisation.libvirtd.enable = true;
	programs.virt-manager.enable = true;

	virtualisation.docker.enable = true;
	virtualisation.docker.storageDriver = "btrfs";
	virtualisation.docker.extraOptions = "--feature compose";

	#users
	users.users.root.hashedPassword = "!";
	users.users.bald = {
		isNormalUser = true;
		extraGroups = [ "wheel" "networkmanager" "video" "audio" "libvirtd" "docker"];
		shell = pkgs.zsh;
		initialPassword = "changeme";
	};

	# Graphic env
	services.displayManager.ly.enable = true;
	programs.sway = {
		enable = true;
		wrapperFeatures.gtk = true;
	};

	xdg.portal = {
		enable = true;
 		wlr.enable = true;
		extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
		config.common.default = [ "wlr" "gtk"];
	};

	# Security
	security.polkit.enable = true;
	security.pam.services.swaylock = {};

	# Audio
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
	};

	# Bluetooth
	hardware.bluetooth = {
  	enable = true;
  	powerOnBoot = true;
	};
	services.blueman.enable = true;



	# SystemPackages
	environment.systemPackages = with pkgs; [
		vim
		curl
		wget
		git
		binutils
	];


	# Nix configuration
	nix.settings = {
		experimental-features = ["nix-command" "flakes"];

	};

	system.stateVersion = "26.05";
	nixpkgs.config.allowUnfree = true;














}
