{
  description = "Shibe's NixOS configuration (Vostro, Hyprland)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.vostro = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/vostro.nix
        ./modules/base.nix
        ./modules/users.nix
        ./modules/hyprland.nix
        home-manager.nixosModules.home-manager
      ];
    };
  };
}