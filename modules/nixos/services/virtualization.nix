{ lib, config, ... }:
{
  options.hostModules.services.virtualization.enable = lib.mkEnableOption "virtualization";
  config = lib.mkIf config.hostModules.services.virtualization.enable {

    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
  };
}
