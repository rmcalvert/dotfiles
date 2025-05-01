{ pkgs, ... }:
{
  imports = [ ../rmcalvert/darwin.nix ];

  users.users.ryan = {
    home = "/Users/ryan";
    # shell = pkgs.fish;
    shell = pkgs.zsh;
  };
}
