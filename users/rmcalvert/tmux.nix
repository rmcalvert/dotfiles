{pkgs, lib, ...}:
{
  programs.tmux = {
    enable = true;
    escapeTime = 10;
    prefix = "C-space";
    sensibleOnTop = false;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "wezterm";

    extraConfig = lib.fileContents ../dot_config/tmux/.config/tmux/tmux.conf;

    plugins = with pkgs.tmuxPlugins; [
      logging
      pain-control
      sessionist
      tmux-thumbs
      yank
    ];
  };
}
