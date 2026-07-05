{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.hostModules.core.boot.enable = lib.mkEnableOption "boot";
  config = lib.mkIf config.hostModules.core.boot.enable {

    boot = {
      loader = {
        limine.enable = true;
        efi.canTouchEfiVariables = true;
      };
      kernelPackages = pkgs.linuxPackages_latest;
      kernelParams = [ "splash" ];
    };

    services.fstrim.enable = true;
  };
}
