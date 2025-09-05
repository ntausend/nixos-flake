{config, lib, pkgs,...}:

{

  programs.fastfetch = {
    enable = true;
    # alternative: could be imported from the json file by builtins.fromJson
    settings = {
      
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      "logo" = {
        "source" = ./cat.txt;
        "type" = "auto";
        #"source" = "nixos_small";
        #"height" = 15;
        #"width" = 26;
        "padding" = {
            #"top" = 0;
            #"left" = 2;
            "right" = 5;
         };
       };

       "modules" = [
         {
           "type" = "os";
           "key" = " OS";
           "keyColor" = "magenta";
         }
         {
           "type" = "packages";
           "key" = " Packages";
           "keyColor" = "magenta";
         }
         {
           "type" = "uptime";
           "key" = " Uptime";
           "keyColor" = "magenta";
         }
         {
           "type" = "command";
           "key" = " OS Age";
           "text" = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
           "keyColor" = "magenta";
         }
       ];
    };         
  };
}
