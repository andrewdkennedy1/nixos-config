# Repository Guidelines

## Project Structure & Module Organization

- `flake.nix` is the entry point for all NixOS and Home Manager configuration.
- `hosts/` contains host-specific settings. `hosts/vostro.nix` is the target host.
- `modules/` holds reusable NixOS modules (`base.nix`, `users.nix`, `hyprland.nix`).
- `home/` contains Home Manager profiles (e.g., `home/shibe.nix`).
- `README.md` documents rebuild steps and the hardware config workflow.

## Build, Test, and Development Commands

- `sudo nixos-rebuild switch --flake .#vostro` — build and activate the system configuration.
- `sudo nixos-rebuild build --flake .#vostro` — build only, without switching.
- `nix flake check` — basic flake evaluation checks.
- `nix fmt` — format Nix files if a formatter is available in your environment.

## Coding Style & Naming Conventions

- Use 2-space indentation and standard Nix formatting.
- Keep module files small and single-purpose (system base, users, Hyprland, etc.).
- Host names match the flake target (e.g., `vostro`), and host files live in `hosts/`.

## Testing Guidelines

- No automated tests are defined yet.
- Prefer `nix flake check` before committing changes.

## Commit & Pull Request Guidelines

- Commit messages use short, imperative summaries (e.g., “Add …”, “Wire …”, “Theme …”).
- PRs should describe the change, mention the affected module path, and include any relevant rebuild commands or screenshots for UI changes.

## Hardware Configuration Workflow

- Do **not** commit `hardware-configuration.nix` during pre-install.
- After install, copy it to `hosts/vostro-hardware.nix`, import it in `hosts/vostro.nix`, then commit.