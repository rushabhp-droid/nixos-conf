{ lib, config, ... }:
{
  options.hostModules.services.ssh.enable = lib.mkEnableOption "ssh";
  config = lib.mkIf config.hostModules.services.ssh.enable {

    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    services.fail2ban = {
      enable = true;
    };
  };
}
