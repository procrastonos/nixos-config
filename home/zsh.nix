{ config, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      bindkey -e          # See https://unix.stackexchange.com/questions/5484/zle-i-cannot-find-why-ctrlr-does-not-work-for-non-root
      bindkey  "^[[1~"    beginning-of-line
      bindkey  "^[[4~"    end-of-line
      bindkey  "^[[3~"    delete-char
      uwufetch --image
    '';
    prezto = {
      enable = true;
      pmodules =
        [
          "completion"
        ];
    };
    shellAliases = {
      ls = "eza --icons --group-directories-first";
      ll = "eza -l --icons --group-directories-first";
      la = "eza -la --icons --group-directories-first";
      cat = "bat";
      gst = "git status";
      htop = "btop";
    };
  };
}

