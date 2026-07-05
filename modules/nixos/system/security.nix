{ lib, config, ... }:
{
  options.hostModules.system.security.enable = lib.mkEnableOption "security";
  config = lib.mkIf config.hostModules.system.security.enable {

    networking.firewall = {
      enable = true;
    };

    security.apparmor = {
      enable = true;
    };
  };
}
