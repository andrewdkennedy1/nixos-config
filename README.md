# nixos-config

Flake-based NixOS configuration with Hyprland (Wayland). This repo is the
single source of truth for rebuilding the system on new hardware.

## Quick Start

Rebuild the Vostro laptop:
  sudo nixos-rebuild switch --flake .#vostro

Rebuild the desktop (i9 + RTX 3080 Ti):
  sudo nixos-rebuild switch --flake .#desktop

## Hosts

- `vostro`: Dell Vostro laptop (Intel iGPU)
- `desktop`: Desktop workstation (NVIDIA GPU)

## Post-Install Hardware Config

After installing NixOS on a machine, copy its generated hardware config and
import it from the host file.

Example for Vostro:
  cp /etc/nixos/hardware-configuration.nix hosts/vostro-hardware.nix

Then uncomment the import in `hosts/vostro.nix`:
  imports = [ ./vostro-hardware.nix ];

Example for Desktop:
  cp /etc/nixos/hardware-configuration.nix hosts/desktop-hardware.nix
  imports = [ ./desktop-hardware.nix ];

## Notes

- Home Manager is enabled for user `shibe` in `home/shibe.nix`.
- Hyprland theming, waybar, wofi, and wallpaper are set in Home Manager.
