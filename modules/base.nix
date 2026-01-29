{ config, pkgs, ... }:

{
  system.stateVersion = "24.11";

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.useDHCP = false;

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
    gh
    nodejs
    (python3.withPackages (ps: [ ps.pip ps.virtualenv ]))
    rustup
    vscode
    discord
    remmina
    openvpn
    networkmanager-openvpn
    antigravity-fhs
  ];
}
