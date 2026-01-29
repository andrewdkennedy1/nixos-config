{ config, pkgs, ... }:

{
  home.username = "shibe";
  home.homeDirectory = "/home/shibe";

  programs.git.enable = true;
  programs.foot.enable = true;
  programs.waybar.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",preferred,auto,1";
      "$mod" = "SUPER";

      bind = [
        "$mod, Return, exec, foot"
        "$mod, D, exec, wofi --show drun"
        "$mod, Q, killactive"
        "$mod, M, exit"
        "$mod, F, fullscreen"
      ];

      exec-once = [
        "waybar"
      ];

      input = {
        kb_layout = "us";
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };

      decoration = {
        rounding = 8;
      };
    };
  };

  home.stateVersion = "24.11";
}
