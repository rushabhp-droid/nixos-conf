{
  config,
  pkgs,
  lib,
  ...
}:
{
  options.sys.hm.hyprland.enable = lib.mkEnableOption "hyprland";

  config = lib.mkIf config.sys.hm.hyprland.enable {
    xdg.configFile."uwsm/env".source =
      "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";

    home.packages = [
      (pkgs.writeShellScriptBin "volume-osd" ''
        #!/usr/bin/env bash

        action=$1

        if [ "$action" = "up" ]; then
          wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
        elif [ "$action" = "down" ]; then
          wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        elif [ "$action" = "mute" ]; then
          wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        elif [ "$action" = "mic-mute" ]; then
          wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
          notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -t 1500 "  Microphone" "Mute Toggled"
          exit 0
        fi

        vol_info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

        if echo "$vol_info" | grep -q "\[MUTED\]"; then
          notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -t 1500 "󰖁  Volume" "Muted"
        else
          vol=$(echo "$vol_info" | awk '{print int($2 * 100)}')
          notify-send -h string:x-canonical-private-synchronous:sys-notify -h int:value:$vol -u low -t 1500 "  Volume" "''${vol}%"
        fi
      '')
    ];

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
