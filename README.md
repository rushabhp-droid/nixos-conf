# NixOS Configuration

Welcome to my highly professional, declarative NixOS configuration! ❄️

This repository manages the system configuration, packages, and dotfiles for my machine(s) using Nix flakes and Home Manager. It is designed to be fully reproducible, strictly stylized, and optimized for a modern Wayland workflow.

## 🌟 Key Features

- **Window Manager**: [Hyprland](https://hyprland.org/), providing a buttery smooth Wayland compositor experience.
- **Status Bar**: [Waybar](https://github.com/Alexays/Waybar) with a highly customized layout and native Stylix color injection.
- **Application Launcher**: [Rofi (Wayland)](https://github.com/lbonn/rofi) configured with a custom, horizontal `.rasi` theme featuring dynamic image embedding.
- **Terminal**: [Alacritty](https://alacritty.org/) with `zsh` as the default shell.
- **Global Theming**: [Stylix](https://github.com/danth/stylix) applies a unified `Base16Kvantum` theme (and fonts like JetBrainsMono) across the *entire* OS automatically.
- **Secrets Management**: [sops-nix](https://github.com/Mic92/sops-nix) handles sensitive data (passwords, tokens) using age encryption.
- **Power Management**: Auto-tuned specifically for modern Intel/NVIDIA hybrid setups (PRIME, `finegrained` D3 state, `intel_pstate` scaling).
- **Security Hardened**: Built-in AppArmor profiles and `auditd` logging configured centrally.
- **Code Quality**: Pre-commit hooks enforce strict formatting (`nixfmt`, `stylua`) and static analysis (`statix`, `deadnix`).

## 📂 Repository Structure

The repository is modularly organized to separate system-wide behavior from user-specific dotfiles.

```text
├── flake.nix                  # Entry point defining inputs, outputs, and formatting
├── hosts/
│   └── laptop/
│       ├── configuration.nix  # Core system configuration for the "twin" host
│       └── home/
│           └── home.nix       # Home Manager entry point for the user
├── modules/
│   ├── nixos/                 # System-level modules (hardware, drivers, sops, security)
│   └── home-manager/          # User-level modules (Hyprland, Waybar, Rofi, Stylix)
├── overlays/                  # Centralized Nixpkgs overlays (custom kernels, packages)
├── secrets.yaml               # Encrypted SOPS data
└── treefmt.nix                # Unified formatting and linting configuration
```

## 🚀 Installation & Usage

### Rebuilding the System

To apply the configuration to the host, run the following command from the root of this repository:

```bash
sudo nixos-rebuild switch --flake .#twin
```

*Note: For testing changes without applying them to the bootloader, use `test` or `build` instead of `switch`.*

### Code Formatting & Linting

This repository enforces strict code quality using `treefmt` (which wraps `nixfmt` for Nix files, `stylua` for Lua files, `statix` for anti-patterns, and `deadnix` for unused variables). 

You can automatically format and lint the entire repository by running:

```bash
nix fmt
```

A pre-commit hook is automatically provided via the flake's development shell. Simply run `nix develop` to install it into your local `.git/hooks/pre-commit`, ensuring all commits meet the repository's quality standards.

### Managing Secrets

Secrets are managed via `sops-nix` and `age`. For detailed instructions on how to encrypt new secrets, add keys, or decrypt existing files, please refer to the documentation inside `modules/nixos/secrets/README.md`.

## ⚙️ Maintenance 

- **Updating inputs:** `nix flake update`
- **Garbage Collection:** `nix-collect-garbage -d` (Use with `sudo` to clean system profiles)
