{
  description = "Nix System Configuration";

  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };
    darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    # Optional: Declarative tap management
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs-stable.follows = "nixpkgs-unstable";
      # inputs.nixpkgs-stable.follows = "nixpkgs-stable";
    };
  };
  outputs =
    {
      self,
      nixpkgs-stable,
      nixpkgs-unstable,
      darwin,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      homebrew-bundle,
      home-manager,
      nixos-wsl,
      ...
    }@inputs:
    let
      darwinSystem =
        {
          user,
          system ? "aarch64-darwin",
        }:
        let
          # pkgs = nixpkgs-stable.legacyPackages.${system};
          inherit (nixpkgs-stable.legacyPackages.${system}) lib;
          nixpkgsConfig = {
            inherit system;
            config.allowUnfree = true;
          };

          # nixpkgs.for = {
          # Pattern from https://github.com/chris-martin/home/blob/dc79903c93f654108ea3c05cfd779bdef72eb584/os/flake.nix
          #vscode = import inputs."nixpkgs-for-vscode-${hostname}" nixpkgsConfig;
          #hoogle = import inputs."nixpkgs-for-hoogle-${hostname}" nixpkgsConfig;
          # };
          nixpkgs.from = {
            stable = import nixpkgs-stable nixpkgsConfig;
            unstable = import nixpkgs-unstable nixpkgsConfig;
          };

        in
        # unstable = import nixpkgs-unstable { inherit system; };
        #       unstable = import nixpkgs-unstable {
        #         system = final.system;
        #       };
        darwin.lib.darwinSystem {
          system = system;
          modules = [
            ./darwin/darwin.nix
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                # Install Homebrew under the default prefix
                enable = true;

                # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
                enableRosetta = true;

                # User owning the Homebrew prefix
                user = user;

                # Optional: Declarative tap management
                taps = {
                  "homebrew/homebrew-core" = homebrew-core;
                  "homebrew/homebrew-cask" = homebrew-cask;
                  "homebrew/homebrew-bundle" = homebrew-bundle;
                };

                # Optional: Enable fully-declarative tap management
                #
                # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
                mutableTaps = false;
              };
            }
            home-manager.darwinModules.home-manager
            {
              #j_module.args = {
              #inherit inputs;
              # };
              home-manager = {
                extraSpecialArgs = {
                  inherit nixpkgs;
                };
                users.${user} = import ./home-manager;
                useGlobalPkgs = true;
                useUserPackages = true;
              };
              users.users.${user} = {
                home = "/Users/${user}";
                # shell = pkgs.zsh;
              };
              # environment.shells = with pkgs; [ zsh ];
              # users.defaultUserShell = pkgs.zsh;
              nix.settings.trusted-users = [ user ];
            }
          ];
        };
    in
    {
      # nixosConfigurations = {
      #   nixos = nixpkgs.lib.nixosSystem {
      #     system = "x86_64-linux";
      #     modules = [
      #       nixos-wsl.nixosModules.wsl
      #       ./nixos/configuration.nix
      #       ./dot_config/wsl
      #       home-manager.nixosModules.home-manager
      #       {
      #         home-manager = {
      #           users.nixos = import ./home-manager;
      #           useGlobalPkgs = true;
      #           useUserPackages = true;
      #         };
      #         nix.settings.trusted-users = [ "nixos" ];
      #       }
      #     ];
      #   };
      # };
      darwinConfigurations = {
        "Ryans-MacBook-Pro" = darwinSystem {
          user = "ryan";
          system = "aarch64-darwin";
        };
      };
    };
}
