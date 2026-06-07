{ config, pkgs, ...}:

{
	imports = [ 
		./hardware-configuration.nix 
	];


	# Bootloader configuration
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
	boot.initrd.kernelModules = [ "dm-crypt" "dm_mod" ];
    boot.initrd.luks.devices."crypted" = {
		device = "/dev/disk/by-partlabel/disk-main_disk-luks";
		allowDiscards = true;
	};

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
	#programs.hyprland.enable = true;
	services.xserver.enable = true;
	services.desktopManager.gnome.enable = true;

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
