{ pkgs, lib, ... }:
{
  programs.tmux = {
    enable = true;
    escapeTime = 10;
    prefix = "C-space";
    sensibleOnTop = false;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = if pkgs.stdenv.isDarwin then "xterm-ghostty" else "wezterm";

    extraConfig = lib.fileContents dot_config/tmux/tmux.conf;

    plugins = with pkgs.tmuxPlugins; [
      logging
      pain-control
      sessionist
      tmux-thumbs
      yank
    ];
  };
}
