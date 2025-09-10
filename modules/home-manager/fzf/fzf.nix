{
  config,
  pkgs,
  ...
}:
{
  home.packages = [pkgs.fzf];

  # TODO: nice configurations of fzf
  # maybe write a nix function that returns the correct colorscheme based on the systems configuration

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    colors = import ./catppuccin-macchiato.nix {};
  };
}
