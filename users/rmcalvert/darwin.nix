{ pkgs, ... }:
{
  imports = [ ../shared/darwin.nix ];

  users.users.rmcalvert = {
    home = "/Users/rmcalvert";
    shell = pkgs.zsh;
  };
}
