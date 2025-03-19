# Run with: nix develop
{
  description = ''
    Development environment for
    Ruby and Rails'';

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.lib.mkEnv {
        system = "aarch64-darwin"; # aarch64-darwin, x86_64-linux
        packages = pkgs: [
          pkgs.ruby_3_2
          # pkgs.rails
          pkgs.redis
          pkgs.postgresql
          pkgs.nginx
          pkgs.git
          pkgs.buildah
          pkgs.docker
          pkgs.jq
          pkgs.ripgrep
          pkgs.zsh
        ];
      };
    in { devShell = pkgs; };
}
