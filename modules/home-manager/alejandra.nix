{
  config,
  pkgs,
  ...
}: let
  alejandra =
    (import (builtins.fetchTarball {
      url = "https://github.com/kamadorueda/alejandra/tarball/4.0.0";
      sha256 = "0000000000000000000000000000000000000000000000000000";
    }) {}).outPath;
in {
  imports = [
    # Paths to other modules.
    # Compose this module out of smaller ones.
  ];

  options = {
    # Option declarations.
    # Declare what settings a user of this module can set
    # Usually this includes a global "enable" option which defaults to false.
    optionName = mkEnableOption "Enable Module";
  };

  config = mkIf cfg.enable {
    home.packages = [alejandra];
  };
  #[
  # Option definitions.
  # Define what other settings, services and resources should be active.
  # Usually these depend on whether a user of this module chose to "enable" it
  # Using the "option" above
  # Options for modules imported in "imports" can be set here.
  #];
}
