{ config, pkgs, ... }:

{
  networking.hostName = "vostro";

  time.timeZone = "America/Los_Angeles";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.networkmanager.enable = true;

  # Hardware configuration will be added post-install:
  # imports = [ ./vostro-hardware.nix ];
}