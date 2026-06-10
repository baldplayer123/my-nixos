{ pkgs, lib, config, ... }:
{
	# Dotfiles (raw imports)
	home.file.".config/sway".source = ./dotfiles/sway;
	home.file.".vimrc".source = ./dotfiles/vim/.vimrc;
	home.file.".config/waybar".source = ./dotfiles/waybar;
	home.file.".config/swaylock/config".source = ./dotfiles/swaylock/config;
    home.file.".config/wofi".source = ./dotfiles/wofi;
    home.file.".config/kitty/kitty.conf".source = ./dotfiles/kitty/kitty.conf;

	# User packages
	home.packages = with pkgs; [
		# Wayland / Sway desktop
		kitty
		wofi
		waybar
		swaybg        # Wallpaper
		swaylock      # config via dotfile
		swayidle      # launched from sway config
		mako
		grim
		slurp
		wl-clipboard
		brightnessctl

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
		fd
        discord-ptb

		# Apps
		firefox
		keepassxc
		obsidian
		gimp
	];

    programs.zsh = {
            enable = true;
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;
            enableCompletion = true;
            shellAliases = {
              rebuild = "sudo nixos-rebuild switch --flake .#laptop";
            };
            initContent = lib.mkAfter ''
              bindkey '^R' fzf-history-widget
              bindkey '^T' fzf-file-widget
              bindkey '\ec' fzf-cd-widget
    
              setopt prompt_subst
              PROMPT='%B%n@%m%b%F{244}:%f%F{109}%~%f%F{244}/%f %B%F{109}>%b%f '
            '';
          };





	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
		defaultCommand = "fd --type f --hidden --exclude .git";
		defaultOptions = [ "--height 40%" "--border" "--layout=reverse" ];
		fileWidgetCommand = "fd --type f --hidden --exclude .git";
		changeDirWidgetCommand = "fd --type d --hidden --exclude .git";
	};
    
    programs.firefox = {
		enable = true;
		profiles.bald = {
			settings = {
				"ui.systemUsesDarkTheme" = 1;
				"layout.css.prefers-color-scheme.content-override" = 0;
				"browser.theme.dark-private-windows" = true;
				"extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
			};
		};
	};

    gtk = {
		enable = true;
		theme = {
			name = "Adwaita-dark";
			package = pkgs.gnome-themes-extra;
		};
	};

	home.username = "bald";
	home.homeDirectory = "/home/bald";
	home.stateVersion = "26.05";
}
