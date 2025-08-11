# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common Commands

### System Builds and Updates

**Darwin/macOS:**
- Initial setup: `nix run nix-darwin -- switch --flake github:rmcalvert/dotfiles`
- Update system: `darwin-rebuild switch --flake ~/Projects/dotfiles`

**WSL2/NixOS:**
- Initial setup: `sudo nixos-install --flake github:rmcalvert/dotfiles#nixos`
- Update system: `sudo nixos-rebuild switch --flake ~/Projects/dotfiles`

### Flake Management
- View flake metadata: `nix flake metadata .`
- Update single input: `nix flake lock --update-input <input-name>`
- Interactive input selection: `nix flake metadata --json | nix run nixpkgs#jq ".locks.nodes.root.inputs[]" | sed "s/\"//g" | nix run nixpkgs#fzf`

## Architecture Overview

This is a **Nix-based dotfiles configuration** using flakes for declarative system management across macOS (nix-darwin) and Linux (NixOS/WSL).

### Core Structure

- **flake.nix**: Main configuration entry point defining system inputs and outputs
- **lib/mksystem.nix**: System builder function that creates NixOS or Darwin configurations
- **machines/**: Machine-specific configurations (mac.nix, wsl.nix)
- **users/**: User-specific configurations with OS-specific and home-manager modules

### Key Components

**System Management:**
- Uses nix-darwin for macOS and NixOS for Linux
- Supports both native macOS and WSL2 environments
- Modular system builder in `lib/mksystem.nix` handles platform differences

**User Configuration:**
- Home Manager integration for user-level package and configuration management
- Shared configurations in `users/shared/` with user-specific overrides
- Dotfiles stored in `users/shared/dot_config/` and linked via Home Manager

**Tool Configurations:**
- **Neovim**: Custom Lua configuration with Lazy.nvim plugin manager
- **Tmux**: Configured with custom prefix (C-space) and plugin management
- **Git**: Global configuration with custom ignore files
- **Shell**: Zsh with starship prompt and mise for runtime version management
- **Terminal**: Supports Ghostty, WezTerm, and other terminal emulators

### Development Tools
- **mise**: Runtime version management (replaces tools like nvm, rbenv)
- **direnv**: Automatic environment loading with nix-direnv integration
- **starship**: Cross-shell prompt with custom configuration
- **lazygit**: Terminal UI for Git operations

The system follows a declarative approach where all configurations are version-controlled and reproducible across different machines and users.