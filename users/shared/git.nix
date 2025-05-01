{ ... }:
{
  home.file = {
    ".cvsignore".source = dot_config/git/cvsignore;
    ".gitconfig".source = dot_config/git/gitconfig;
  };

  programs.git = {
    enable = true;

    lfs.enable = true;
  };
}
