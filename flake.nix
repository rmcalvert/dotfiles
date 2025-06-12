{
  description = "Nix System Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      ...
    }@inputs:
    let
      overlays = [
        # This overlay makes unstable packages available through pkgs.unstable
        (final: prev: {
          unstable = import inputs.nixpkgs-unstable {
            system = prev.system;
            config.allowUnfree = true;
          };
        })
      ];
      mkSystem = import ./lib/mksystem.nix {
        inherit overlays nixpkgs inputs;
      };
    in
    {
      nixosConfigurations.wsl = mkSystem "wsl" {
        system = "x86_64-linux";
        user = "rmcalvert";
        wsl = true;
      };
      darwinConfigurations.Ryans-MacBook-Pro = mkSystem "mac" {
        system = "aarch64-darwin";
        user = "ryan";
        darwin = true;
      };
      darwinConfigurations.Ryans-Mac-mini = mkSystem "mac" {
        system = "aarch64-darwin";
        user = "ryan";
        darwin = true;
      };
    };
}
