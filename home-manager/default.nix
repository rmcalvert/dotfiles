{
  pkgs,
  lib,
  nixpkgs,
  # inputs,
  ...
}:
{
  imports = [
    # inputs.nixvim.homeManagerModules.nixvim
    # ./nixvim
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
  xdg.configFile."ghostty/config".source = ./../dot_config/ghostty/config;

  fonts.fontconfig.enable = true;

  home = {
    stateVersion = "23.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = [
      nixpkgs.from.stable.amber
      nixpkgs.from.stable.lazygit
      nixpkgs.from.stable.markdown-oxide
      nixpkgs.from.stable.nixd
      nixpkgs.from.stable.nixfmt-rfc-style
      nixpkgs.from.unstable.neovim
      nixpkgs.from.stable.just # https://github.com/casey/just
      nixpkgs.from.stable.nix-search-cli
      nixpkgs.from.stable.ripgrep
      nixpkgs.from.stable.smartcat

      # Fonts
      nixpkgs.from.stable.fira-code
      nixpkgs.from.stable.atkinson-hyperlegible
      nixpkgs.from.stable.jetbrains-mono
    ];

    sessionVariables = { };
  };

  home.file.".gemrc".source = ../dot_config/.gemrc;

  programs = {
    zsh = {
      enable = true;
      # interactiveShellInit = ''
      #   set fish_greeting # N/A
      #   bind \cw backward-kill-word
      # '';
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    # jujutsu.enable = true;
  };
}
