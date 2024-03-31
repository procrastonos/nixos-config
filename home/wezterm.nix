{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ./config-files/wezterm/wezterm.lua;
  };
}
