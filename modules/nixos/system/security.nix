{
  lib,
  config,
  ...
}:
{
  options.sys.security.enable = lib.mkEnableOption "security";

  config = lib.mkIf config.sys.security.enable {
    # AppArmor
    security.apparmor = {
      enable = true;
      killUnconfinedConfinables = true;
    };

    # Auditd
    security.auditd.enable = false;
    boot.kernelParams = [ "audit=0" ];
  };
}
