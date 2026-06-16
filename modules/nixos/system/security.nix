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
      killUnconfinedTcpWrappers = true;
    };

    # Auditd
    security.auditd.enable = true;
  };
}
