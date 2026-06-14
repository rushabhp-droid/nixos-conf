{
  config,
  pkgs,
  lib,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;

    package = null;
    portalPackage = null;

    configType = "lua";

    extraLuaFiles = {
      "autostart" = {
	content = ./raw/autostart.lua;
	autoLoad = true;
      }; 
      "general" = {
        content = ./raw/general.lua;
        autoLoad = true;
      };
      "binds" = {
        content = ./raw/keybinds.lua;
        autoLoad = true;
      };
      "colors" = {
        content = ./raw/colors.lua;
        autoLoad = true;
      };
      "animation" = {
        content = ./raw/animation.lua;
        autoLoad = true;
      };
      "rules" = {
        content = ./raw/rules.lua;
        autoLoad = true;
      };
    };
  };
}
