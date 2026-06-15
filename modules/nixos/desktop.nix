{ config, pkgs, inputs, ... }:
{
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
}
