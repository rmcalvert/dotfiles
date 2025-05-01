{ pkgs, ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "23.05";

  # programs.zsh.enable = true;
  program.fish.enable = true;
  # users.defaultUserShell = pkgs.zsh;
  users.defaultUserShell = pkgs.fish;

  time.timeZone = "America/New_York";
}
