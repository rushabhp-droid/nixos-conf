{ lib, config, ... }:
{
  options.hostModules.hardware.udev.enable = lib.mkEnableOption "udev";
  config = lib.mkIf config.hostModules.hardware.udev.enable {

    # Create a persistent symlink for the Intel iGPU
    services.udev.extraRules = ''
      KERNEL=="card*", KERNELS=="0000:00:02.0", SUBSYSTEM=="drm", SUBSYSTEMS=="pci", SYMLINK+="dri/intel-igpu"
    '';
  };
}
