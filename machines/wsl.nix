# NixOS-WSL specific options are documented on the NixOS-WSL repository:
# https://github.com/nix-community/NixOS-WSL

{ pkgs, ... }:

{
  imports = [
    # include NixOS-WSL modules
  ];

  nixpkgs.config.allowUnfree = true;

  environment = {
    systemPackages = with pkgs; [
      wslu
      wsl-open
      wezterm.terminfo
    ];
  };

  wsl = {
    enable = true;
    defaultUser = "ryan";
    interop.includePath = true;
  };
}
