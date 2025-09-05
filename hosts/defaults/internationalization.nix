{config, pkgs, globalSystemSettings,...}:
{
    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = globalSystemSettings.i18n;
      LC_IDENTIFICATION = globalSystemSettings.i18n;
      LC_MEASUREMENT = globalSystemSettings.i18n;
      LC_MONETARY = globalSystemSettings.i18n;
      LC_NAME = globalSystemSettings.i18n;
      LC_NUMERIC = globalSystemSettings.18n;
      LC_PAPER = globalSystemSettings.18n;
      LC_TELEPHONE = globalSystemSettings.18n;
      LC_TIME = globalSystemSettings.18n;
    };

}
