{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./nixvim
    ./git.nix
    ./starship.nix
    #   ./vscode.nix
    # ./tmux.nix
  ];

  xdg.enable = true;
  xdg.configFile."hammerspoon" = lib.mkIf pkgs.stdenv.isDarwin {
    source = ./../dot_config/hammerspoon;
  };
  xdg.configFile."kanata" = lib.mkIf pkgs.stdenv.isDarwin { source = ./../dot_config/kanata; };
  # xdg.configFile."ghostty/config".source = ./../dot_config/ghostty/config;

  fonts.fontconfig.enable = true;

  home = {
    stateVersion = "23.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
	    packages  = with pkgs; [
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
    ];

    sessionVariables = { };
  };

  home.file.".gemrc".source = ../dot_config/.gemrc;

  programs = {
    zsh = {
      enable = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    # jujutsu.enable = true;
  };
}
