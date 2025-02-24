# Dotfiles

This is to describe the barebones development system I use. Supports NixOS on WSL, Intel and Silicon Macs.

Featuring:
- Wezterm
- Tmux
- Fish
- Neovim
- OSX
  - darwin-nix
  - Hammerspoon
  - homebrew mas
  - yabai

## Install Nix

On OSX: [Determinate Installer](https://github.com/DeterminateSystems/nix-installer).
        ~~Install Homebrew (can this be automated?)~~
On WSL2: [WSL2 Nix](https://github.com/nix-community/NixOS-WSL?tab=readme-ov-file)

### NixOS (currently just WSL)

`sudo nixos-install --flake github:rmcalvert/dotfiles#nixos`

### Darwin/Linux

`nix run nix-darwin -- switch --flake github:rmcalvert/dotfiles`

## Update

### NixOS

`sudo nixos-rebuild switch --flake ~/Projects/dotfiles`

### Darwin

`darwin-rebuild switch --flake ~/Projects/dotfiles`

## Home Manager

You could use something like this to import my home-manager standalone.

```nix
{ config, pkgs, ... }: {
  home-manager.users.ryan = import ./home-manager/home.nix;
}
```
Metadata for current flake
`nix flake metadata .`
`nix flake metadata --json | nix run nixpkgs#jq ".locks.nodes.root.inputs[]" | sed "s/\"//g" | nix run nixpkgs#fzf`` 

Update a single input
`nix flake lock --update-input <nixpkgs, etc>`

Initialize from template
`nix flake init --template <template/name>


Initial config copied/stolen from [evantravers dotfiles](https://github.com/evantravers/dotfiles/commit/7e4d12e66cf9a5d95424d575a8ea79c47e5ad95a)
