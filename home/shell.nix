{ config, pkgs, ... }:
{
  imports =
    [
      ./zsh.nix
    ];

  # Shell
  programs.bash.enable = true;

  # Prompt
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      line_break = {
        disabled = true;
      };
    };
  };

  # History / Search
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  # Commandline Tools
  programs.htop.enable = true;
  programs.bat.enable = true;
  programs.eza.enable = true;
}

