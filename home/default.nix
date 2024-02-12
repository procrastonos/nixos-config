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

  home.packages = with pkgs; [
      firefox
      telegram-desktop
      gcc
      cargo
      tree
      btop
      tofi
      uwufetch
      swaylock-effects
      nerdfonts
      neovide
      swww
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

  home.stateVersion = "23.11";
}
