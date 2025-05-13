{ pkgs, ... }:
{
  imports = [ ../shared/darwin.nix ];

  users.users.ryan = {
    home = "/Users/ryan";
    shell = pkgs.zsh;
  };
}
