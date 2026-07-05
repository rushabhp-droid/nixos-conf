{
  config,
  lib,
  hostname,
  ...
}:
{
  options.hostModules.core.networking.enable = lib.mkEnableOption "networking";
  config = lib.mkIf config.hostModules.core.networking.enable {

    networking = {
      hostName = hostname;
      networkmanager = {
        enable = true;
      };
    };
  };
}
