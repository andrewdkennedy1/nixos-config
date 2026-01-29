{ config, pkgs, ... }:

{
  users.users.shibe = {
    isNormalUser = true;
    description = "Shibe";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.bash;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.shibe = import ../home/shibe.nix;

  security.sudo.wheelNeedsPassword = true;
}
