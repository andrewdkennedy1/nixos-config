nixos-config

Flake-based NixOS configuration for a Dell Vostro laptop.
Desktop environment: Hyprland (Wayland)
GPU: Intel Iris Xe

This repository is intended to fully define the operating system.

Rebuild command:
  sudo nixos-rebuild switch --flake .#vostro

On first install, copy hardware-configuration.nix into:
  hosts/vostro-hardware.nix
and import it from hosts/vostro.nix