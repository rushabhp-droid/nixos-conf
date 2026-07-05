{ lib, config, ... }:
{
  options.hostModules.core.locale.enable = lib.mkEnableOption "locale";
  config = lib.mkIf config.hostModules.core.locale.enable {

    time.timeZone = "Asia/Kolkata";

    i18n = {
      defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_CTYPE = "en_US.UTF-8";
        LC_ADDRESS = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MESSAGES = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
        LC_COLLATE = "en_US.UTF-8";
      };
    };
  };
}
