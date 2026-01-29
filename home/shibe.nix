{ config, pkgs, ... }:

{
  home.username = "shibe";
  home.homeDirectory = "/home/shibe";

  programs.git.enable = true;

  home.stateVersion = "24.11";
}