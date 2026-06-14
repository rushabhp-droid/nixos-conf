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
	content = ./raw/hyprland/autostart.lua;
	autoLoad = true;
      }; 
      "general" = {
        content = ./raw/hyprland/general.lua;
        autoLoad = true;
      };
      "binds" = {
        content = ./raw/hyprland/keybinds.lua;
        autoLoad = true;
      };
      "colors" = {
        content = ./raw/hyprland/colors.lua;
        autoLoad = true;
      };
      "animation" = {
        content = ./raw/hyprland/animation.lua;
        autoLoad = true;
      };
      "rules" = {
        content = ./raw/hyprland/rules.lua;
        autoLoad = true;
      };
    };
  };
}
