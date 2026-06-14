{
  config,
  pkgs,
  lib,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    # set the Hyprland and XDPH packages to null to use the ones from the NixOS module
    package = null;
    portalPackage = null;
    configType = "lua";
    settings = {
      config = {
        general = {
          gaps_in = 4;
          gaps_out = 5;
          border_size = 2;
        };
        decoration = {
          rounding = 10;
          rounding_power = 2;

          inactive_opacity = 0.95;
          active_opacity = 1.0;

          shadow = {
            enabled = true;
            range = 4;
            render_power = 3;
            color = "0xee1a1a1a";
          };

          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
          };
        };
      };
    };
  };
}
