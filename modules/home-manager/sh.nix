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


  # TODO how to add plugins for zsh?
  #home.packages = [pkgs.zsh-you-should-use];

  # zsh configurations
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
   
    shellAliases = myAliases;
    initContent = lib.mkOrder 1500 ''
         fastfetch
    '';
  };
  programs.zsh.oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        #"you-should-use"
        #"zsh-bat"
        #"dirhistory"
        #"history"
      ];
      #theme = "catppuccin-macchiato";
    }; 
}
