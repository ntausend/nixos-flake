{
  config,
  pkgs,
  ...
}: let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
  };
in {
  # bash configurations
  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
  # zsh configurations
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
  };
}
