# Dotfiles

## Setup

### Mac
1) [Install Nix (via Determinate installer)](https://github.com/DeterminateSystems/nix-installer).
2) [Install HomeBrew](https://brew.sh/)
3) Install system
    >```sh
    >nix run nix-darwin -- switch --flake github:rmcalvert/dotfiles
    >```
4) Clone repo locally
5) To update:
    >```sh
    >darwin-rebuild switch --flake ~/Projects/dotfiles
    >```

### WSL2 (untested)
[WSL2 Nix](https://github.com/nix-community/NixOS-WSL?tab=readme-ov-file)

`sudo nixos-install --flake github:rmcalvert/dotfiles#nixos`

Update:
```sh
sudo nixos-rebuild switch --flake ~/Projects/dotfiles`
```

## Command reference
Metadata for current flake
```sh
nix flake metadata .
nix flake metadata --json | nix run nixpkgs#jq ".locks.nodes.root.inputs[]" | sed "s/\"//g" | nix run nixpkgs#fzf
```

Update a single input
```sh
nix flake lock --update-input <nixpkgs, etc>
```

Initialize from template
```sh
nix flake init --template <template/name>
```
