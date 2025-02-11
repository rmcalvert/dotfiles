{ pkgs, lib, inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./nixvim
    ./git.nix
    #   ./starship.nix
    #   ./vscode.nix
    #   ./tmux.nix
  ];

  xdg.enable = true;
  xdg.configFile."hammerspoon" =
    lib.mkIf pkgs.stdenv.isDarwin { source = ./../dot_config/hammerspoon; };
  xdg.configFile."kanata" =
    lib.mkIf pkgs.stdenv.isDarwin { source = ./../dot_config/kanata; };
  xdg.configFile."ghostty/config".source = ./../dot_config/ghostty/config;

  fonts.fontconfig.enable = true;

  home = {
    stateVersion = "25.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      amber
      lazygit
      markdown-oxide
      nixd
      ollama
      ripgrep
      smartcat

      # Fonts
      # pkgs.nerd-fonts.fira-code
      pkgs.fira-code
      pkgs.atkinson-hyperlegible
      # pkgs.nerd-fonts.jetbrains-mono
      pkgs.jetbrains-mono
    ];

    sessionVariables = { };
  };

  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # N/A
        bind \cw backward-kill-word
      '';
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    jujutsu.enable = true;
  };
}
