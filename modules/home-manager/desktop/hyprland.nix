{ pkgs, ... }:
{
  services.cliphist = {
    enable = true;
    allowImages = true;
  };
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    configType = "lua";

    extraLuaFiles = {

      "on" = {
        content = ./hyprland/on.lua;
        autoLoad = true;
      };

      "monitors" = {
        content = ./hyprland/monitors.lua;
        autoLoad = true;
      };

      "animations" = {
        content = ./hyprland/animations/animations-fast.lua;
        autoLoad = true;
      };

      "binds" = {
        content = ./hyprland/binds.lua;
        autoLoad = true;
      };

      "input" = {
        content = ./hyprland/input.lua;
        autoLoad = true;
      };

      "misc" = {
        content = ./hyprland/misc.lua;
        autoLoad = true;
      };

      "rules" = {
        content = ./hyprland/rules.lua;
        autoLoad = true;
      };
    };

    settings = {
      config = {
        general = {
          gaps_in = 4;
          gaps_out = 5;
          border_size = 2;
          resize_on_border = false;
          layout = "dwindle";
        };

        decoration = {
          rounding = 5;
          rounding_power = 2;

          active_opacity = 1.0;
          inactive_opacity = 0.95;
          blur = {
            enabled = true;
            size = 7;
            passes = 3;
            vibrancy = 0.1696;
          };
        };
      };
    };
  };
}
