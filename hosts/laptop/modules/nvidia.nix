{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };


  imports = [ inputs.cardwire.nixosModules.default ];
  services.cardwire = {
    enable = true;
    settings = {
      auto_apply_gpu_state = true;
      experimental_nvidia_block = true;
      battery_auto_switch = true;
    };
  };
}
