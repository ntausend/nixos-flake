{
  config,
  pkgs,
  lib,
  ...
}: let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    neofetch = "fastfetch";
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
    initContent = lib.mkOrder 1500 ''
	fastfetch
    '';
  };
}
