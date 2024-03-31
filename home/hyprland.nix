{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  #programs.waybar = {
  #};

  home.file.".config/tofi/config".text = builtins.readFile ./config-files/tofi/config;
  home.file."./.wallpapers" = {
    source = ./assets/wallpapers;
    recursive = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;

    settings = {
      autogenerated = "0";

      "$mainMod" = "SUPER";

      exec-once = "swww init; swww img ~/.wallpapers/hyprland_default.png";

      monitor = "eDP-1,1920x1080@60,0x0,1";

      input = {
        kb_layout = "de";
        kb_variant = "neo";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = "1";

        touchpad = {
          natural_scroll = "yes";
        };
      };

      general = {
        gaps_in = "5";
        gaps_out = "20";
        border_size = "2";

        "col.active_border" = "rgba(ff00abee) rgba(d500baee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";
      };

      decoration = {
        rounding = "10";
        drop_shadow = "yes";
        shadow_range = "4";
        shadow_render_power = "3";

        "col.shadow" = "rgba(1a1a1aee)";

        blur = {
          size = "4";
          passes = "2";
          new_optimizations = "on";
        };
      };

      animations = {
        enabled = "yes";
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = "yes";
        preserve_split = "yes";
      };

      gestures = {
        workspace_swipe = "on";
        workspace_swipe_invert = "true";
      };

      windowrule = [
        "float, ^(wezterm)$"
      ];

      bind = [
        # Launch stuff
        "$mainMod, Backspace, exec, tofi-drun --drun-launch=true"
        "$mainMod SHIFT, return, exec, wezterm"
	# Lock
        "$mainMod, L, exec, swaylock"
        "$mainMod SHIFT, U, exec, systemctl suspend; swaylock"
	# Kill, exit
        "$mainMod SHIFT, Q, killactive,"
        "$mainMod SHIFT, X, exit,"
	# Tiling
        "$mainMod SHIFT, SPACE, togglefloating,"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod SHIFT, I, exec, grimshot copy area"
        "$mainMod, N, exec, neovide"
	# Brightness, audio
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s +5%"
        ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      binde = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };

  programs.swaylock = {
    enable = true;
    settings = {
      daemonize = true;
      ignore-empty-password = true;
      image = "~/.wallpapers/hyprland_default_blurred.png";
      font = "Monoid Nerd Font";
      font-size = "60";
      bs-hl-color = "ffffff00";
      caps-lock-bs-hl-color = "ffffff00";
      caps-lock-key-hl-color = "ffffff00";
      inside-color = "ffffff20";
      inside-clear-color = "ffffff80";
      inside-caps-lock-color = "ffffff20";
      inside-ver-color = "ffffff20";
      inside-wrong-color = "ffffff20";
      indicator-radius = "250";
      indicator-thickness = "3";
      key-hl-color = "d500baee";
      layout-bg-color = "ffffff20";
      layout-border-color = "ffffff20";
      layout-text-color = "00000080";
      line-color = "ffffff20";
      line-clear-color = "ffffff80";
      line-caps-lock-color = "ffffff00";
      line-ver-color = "ffffff20";
      line-wrong-color = "ff000080";
      ring-color = "ffffff20";
      ring-clear-color = "ffffff80";
      ring-caps-lock-color = "ffffff00";
      ring-ver-color = "ffffff20";
      ring-wrong-color = "ff202080";
      #separator-color = "d500baee";
      separator-color = "ffffff20";
      text-color = "000000A0";
      text-clear-color = "000000A0";
      text-caps-lock-color = "000000A0";
      text-ver-color = "000000A0";
      text-wrong-color = "00000080";
    };
  };
}
