{ config, pkgs, ... }:

{
  networking.hostName = "desktop";

  time.timeZone = "America/Los_Angeles";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.networkmanager.enable = true;

  # Hardware configuration will be added post-install:
  # imports = [ ./desktop-hardware.nix ];
}
