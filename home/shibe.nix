{ config, pkgs, ... }:

{
  home.username = "shibe";
  home.homeDirectory = "/home/shibe";

  programs.git.enable = true;
  programs.foot.enable = true;
  programs.wofi.enable = true;
  programs.waybar.enable = true;

  programs.foot.settings = {
    main = {
      font = "JetBrainsMono Nerd Font:size=12";
      dpi-aware = "yes";
    };
    colors = {
      foreground = "eaeaea";
      background = "0b0f14";
      regular0 = "111418";
      regular1 = "e86b6b";
      regular2 = "93d49a";
      regular3 = "e5c07b";
      regular4 = "61afef";
      regular5 = "c678dd";
      regular6 = "56b6c2";
      regular7 = "c7ccd1";
      bright0 = "4b5563";
      bright1 = "ef7d7d";
      bright2 = "a7e3ad";
      bright3 = "f2d28b";
      bright4 = "7bb4ff";
      bright5 = "d492f7";
      bright6 = "6bd3e6";
      bright7 = "f1f5f9";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",preferred,auto,1";
      "$mod" = "SUPER";
      "$accent" = "rgb(6ee7ff)";
      "$bg" = "rgba(10,14,20,0.95)";
      "$border" = "rgba(110,231,255,0.85)";
      "$border_inactive" = "rgba(148,163,184,0.35)";

      bind = [
        "$mod, Return, exec, foot"
        "$mod, D, exec, wofi --show drun"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, F, fullscreen"
        "$mod, E, exec, thunar"
      ];

      exec-once = [
        "waybar"
        "hyprpaper"
      ];

      input = {
        kb_layout = "us";
      };

      general = {
        gaps_in = 5;
        gaps_out = 14;
        border_size = 3;
        "col.active_border" = "$border";
        "col.inactive_border" = "$border_inactive";
      };

      decoration = {
        rounding = 12;
        drop_shadow = true;
        shadow_range = 20;
        shadow_render_power = 3;
        "col.shadow" = "rgba(0,0,0,0.5)";
      };

      animations = {
        enabled = true;
        bezier = "overshoot, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 6, overshoot"
          "windowsOut, 1, 5, default, popin 80%"
          "border, 1, 7, default"
          "fade, 1, 6, default"
          "workspaces, 1, 4, default"
        ];
      };

      gestures = {
        workspace_swipe = true;
      };
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "${pkgs.nixos-artwork.wallpapers.dracula}/share/backgrounds/nixos/nix-wallpaper-dracula.png"
      ];
      wallpaper = [
        ",${pkgs.nixos-artwork.wallpapers.dracula}/share/backgrounds/nixos/nix-wallpaper-dracula.png"
      ];
      splash = false;
    };
  };

  programs.waybar.settings = [{
    layer = "top";
    position = "top";
    height = 30;
    margin-top = 10;
    margin-left = 12;
    margin-right = 12;
    spacing = 12;
    modules-left = [ "hyprland/workspaces" "hyprland/window" ];
    modules-center = [ "clock" ];
    modules-right = [ "pulseaudio" "network" "battery" "tray" ];

    "hyprland/workspaces" = {
      format = "{icon}";
      format-icons = {
        "1" = "1";
        "2" = "2";
        "3" = "3";
        "4" = "4";
        "5" = "5";
      };
    };

    clock = {
      format = " {:%a %b %d  %H:%M}";
      tooltip = true;
    };

    network = {
      format-wifi = "  {essid}";
      format-ethernet = "󰈀  {ifname}";
      format-disconnected = "󰖪  down";
      tooltip = true;
    };

    pulseaudio = {
      format = "  {volume}%";
      format-muted = "󰝟  muted";
    };

    battery = {
      format = "  {capacity}%";
      format-charging = "  {capacity}%";
      format-plugged = "  {capacity}%";
    };
  }];

  programs.waybar.style = ''
    * {
      border: none;
      border-radius: 0;
      min-height: 0;
      font-family: "JetBrainsMono Nerd Font", "Noto Sans", sans-serif;
      font-size: 12px;
    }

    window#waybar {
      background: rgba(10, 14, 20, 0.8);
      color: #e5e7eb;
      border: 1px solid rgba(110, 231, 255, 0.4);
      border-radius: 12px;
      padding: 6px 10px;
    }

    #workspaces button {
      padding: 4px 8px;
      margin: 2px;
      color: #94a3b8;
      background: transparent;
      border-radius: 8px;
    }

    #workspaces button.active {
      color: #0b0f14;
      background: #6ee7ff;
    }

    #workspaces button:hover {
      background: rgba(110, 231, 255, 0.15);
      color: #e5e7eb;
    }

    #clock, #network, #pulseaudio, #battery, #tray {
      padding: 4px 10px;
      margin: 2px;
      border-radius: 10px;
      background: rgba(15, 23, 42, 0.6);
    }
  '';

  programs.wofi.settings = {
    show = "drun";
    width = 500;
    height = 360;
    allow_markup = true;
    prompt = "Search";
    term = "foot";
  };

  programs.wofi.style = ''
    window {
      margin: 0px;
      border: 2px solid #6ee7ff;
      background-color: #0b0f14;
      border-radius: 16px;
      font-family: "JetBrainsMono Nerd Font", "Noto Sans", sans-serif;
      font-size: 14px;
    }

    #input {
      margin: 12px;
      padding: 8px 12px;
      border-radius: 10px;
      border: 1px solid #1f2937;
      background-color: #0f172a;
      color: #e5e7eb;
    }

    #entry {
      padding: 8px 12px;
      margin: 4px 12px;
      border-radius: 10px;
    }

    #entry:selected {
      background-color: #6ee7ff;
      color: #0b0f14;
    }
  '';

  home.stateVersion = "24.11";
}
