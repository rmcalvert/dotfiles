{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    # inputs.nixvim.homeManagerModules.nixvim
    # ./nixvim.nix
    ./git.nix
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

  xdg.configFile."mise/config.toml".source = dot_config/mise/config.toml;

  xdg.configFile."nvim/init.lua".source = dot_config/nvim/init.lua;
  xdg.configFile."nvim/lua".source = dot_config/nvim/lua;

  xdg.configFile."starship.toml".source = dot_config/starship.toml;

  home.file.".gemrc".source = dot_config/gemrc;

  home = {
    stateVersion = "23.05";

    packages = with pkgs; [
      amber
      lazygit
      markdown-oxide
      unstable.neovim
      nixd
      nixfmt-rfc-style
      just # https://github.com/casey/just
      nix-search-cli
      ripgrep
      smartcat
      starship
      stylua

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
      enableCompletion = true;
      initContent =
        let
          # 500 (mkBefore): Early initialization (replaces initExtraFirst)
          # 550: Before completion initialization (replaces initExtraBeforeCompInit)
          # 1000 (default): General configuration (replaces initExtra)
          # 1500 (mkAfter): Last to run configuration
          zshConfigEarlyInit = lib.mkOrder 500 '''';
          zshConfig = lib.mkOrder 1000 ''
            PATH="/opt/homebrew/bin:$PATH"
            eval "$(mise activate zsh)"
            eval "$(starship init zsh)"
          '';
        in
        lib.mkMerge [
          zshConfigEarlyInit
          zshConfig
        ];
      # oh-my-zsh = {
      #   enable = true;
      #   plugins = [
      #     "git"
      #   ];
      #   # theme = "robbyrussell";
      # };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

}
