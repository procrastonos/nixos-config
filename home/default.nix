{ config, pkgs, inputs, lib, ... }:
{
  imports =
    [
      ./shell.nix
      ./nixvim.nix
      ./hyprland.nix
      ./wezterm.nix
    ];

  home.username = "luna";
  home.homeDirectory = "/home/${config.home.username}";

  home.packages = with pkgs;
   [
      firefox
      telegram-desktop
      gcc
      cargo
      tree
      btop
      tofi
      uwufetch
      tty-clock
      sway-contrib.grimshot
      nerdfonts
      neovide
      swww
      discord
      inkscape
    ];

  programs.git = {
    enable = true;
    userName = "misterdanb";
    userEmail = "danb@ha.si";

    aliases = {
      alias = "!git config --get-regexp alias | sed 's/alias\\.\\([^ ]*\\) /\\1 := /'";
      graph = "log --graph --decorate --oneline";
      map = "!git graph --all";
      watch = "!watch -ct 'git -c color.status=always status -s && echo && git map --color'";
    };

    extraConfig = {
      pull.rebase = true;
      init.defaultBranch = "main";
      fetch.prune = true;
    };
  };

  programs.home-manager.enable = true;

  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        tweaks = [ "rimless" ];
        variant = "mocha";
      };
    };
  };

  #home.sessionVariables.DEFAULT_BROWSER = "${pkgs.firefox}/bin/firefox";

  home.stateVersion = "23.11";
}
