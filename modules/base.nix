{ config, pkgs, ... }:

{
  system.stateVersion = "24.11";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.useDHCP = false;

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
  ];
}