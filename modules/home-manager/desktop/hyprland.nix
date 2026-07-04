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
        content = ./hyprland/lua/on.lua;
        autoLoad = true;
      };

      "monitors" = {
        content = ./hyprland/lua/monitors.lua;
        autoLoad = true;
      };

      "animations" = {
        content = ./hyprland/lua/animations/animations-fast.lua;
        autoLoad = true;
      };

      "binds" = {
        content = ./hyprland/lua/binds.lua;
        autoLoad = true;
      };

      "input" = {
        content = ./hyprland/lua/input.lua;
        autoLoad = true;
      };

      "misc" = {
        content = ./hyprland/lua/misc.lua;
        autoLoad = true;
      };

      "rules" = {
        content = ./hyprland/lua/rules.lua;
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
          motion_blur = true;

          active_opacity = 1.0;
          inactive_opacity = 0.95;
          blur = {
            enabled = true;
            size = 7;
            passes = 3;
            vibrancy = 0.1696;
            new_optimizations = true;
          };
        };
      };
    };
  };
}
