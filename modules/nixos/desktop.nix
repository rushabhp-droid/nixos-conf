{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
{
  options.sys.desktop.enable = lib.mkEnableOption "desktop";

  config = lib.mkIf config.sys.desktop.enable {
    # Display Manager
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    # Sound (Pipewire)
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      jack.enable = true;
    };

    # Enable touchpad support
    services.libinput.enable = true;

    # Desktop Environment Packages
    environment.systemPackages = [
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
