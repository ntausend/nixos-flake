{config, pkgs, lib, ...}:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 10;
    };
    themeFile = "Catppuccin-Macchiato";
    settings = {
      bold_font = "auto";
    };
  };
}
