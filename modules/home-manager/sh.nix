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
    enableCompletion = true;
    autosuggestion.enable = true;
   
    oh-my-zsh = {
      enable = true;
      plugins = [
        "dirhistory"
        "history"
      ];
    }; 

    shellAliases = myAliases;
    initContent = lib.mkOrder 1500 ''
	fastfetch
    '';
  };

  
  # oh-my-zsh configuration
  #home.packages = [pkgs.oh-my-zsh];
}
