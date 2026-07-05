{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.hostModules.hardware.nvidia.enable = lib.mkEnableOption "nvidia";
  config = lib.mkIf config.hostModules.hardware.nvidia.enable {

    environment.systemPackages = with pkgs; [
      nvidia-vaapi-driver
    ];

    services.xserver.videoDrivers = [ "nvidia" ];
    boot.blacklistedKernelModules = [ "nouveau" ];

    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          intel-media-driver
        ];
      };

      nvidia = {
        modesetting.enable = true;

        package = config.boot.kernelPackages.nvidiaPackages.latest;

        open = true;

        powerManagement = {
          enable = true;
          finegrained = true;
        };
        prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    };
  };
}
