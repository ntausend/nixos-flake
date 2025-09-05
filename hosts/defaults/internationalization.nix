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
      LC_NUMERIC = globalSystemSettings.i18n;
      LC_PAPER = globalSystemSettings.i18n;
      LC_TELEPHONE = globalSystemSettings.i18n;
      LC_TIME = globalSystemSettings.i18n;
    };

}
