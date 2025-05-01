{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./nixvim.nix
    ./git.nix
    ./starship.nix
    ./wezterm.nix
    # ./vscode.nix
    ./tmux.nix
  ];

  xdg.enable = true;

  xdg.configFile."hammerspoon" = lib.mkIf pkgs.stdenv.isDarwin {
    source = dot_config/hammerspoon;
  };
  xdg.configFile."kanata" = lib.mkIf pkgs.stdenv.isDarwin { source = dot_config/kanata; };

  xdg.configFile."ghostty/config".source = dot_config/ghostty/config;

  home.file.".gemrc".source = dot_config/gemrc;

  home = {
    stateVersion = "23.05";

    packages = with pkgs; [
      amber
      lazygit
      markdown-oxide
      nixd
      nixfmt-rfc-style
      just # https://github.com/casey/just
      nix-search-cli
      ripgrep
      smartcat

      # Fonts
      fira-code
      atkinson-hyperlegible
      jetbrains-mono
      cascadia-code
    ];

    sessionVariables = { };
  };

  programs = {
    zsh = {
      enable = true;
    };

    fish = {
      enable = true;
      package = pkgs.unstable.fish; # fish 4.0
      interactiveShellInit = ''
        set fish_greeting # N/A
      '';
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

}
