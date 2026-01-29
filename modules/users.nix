{ config, pkgs, ... }:

{
  users.users.shibe = {
    isNormalUser = true;
    description = "Shibe";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.bash;
  };

  security.sudo.wheelNeedsPassword = true;
}