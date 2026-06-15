{
  config,
  pkgs,
  lib,
  ...
}:
{
  options.sys.hm.hyprland.enable = lib.mkEnableOption "hyprland";

  config = lib.mkIf config.sys.hm.hyprland.enable {
    xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
    wayland.windowManager.hyprland = {
      enable = true;

      package = null;
      portalPackage = null;

      systemd.variables = [ "--all" ];

      configType = "lua";

      settings = {
        on = {
          _args = [
            "hyprland.start"
            (lib.generators.mkLuaInline ''
              function()
                hl.exec_cmd('sh -c "sleep 0.5 && awww img ${config.stylix.image} --transition-type fade --transition-duration 2"')
              end
            '')
          ];
        };
      };

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
  };
}
