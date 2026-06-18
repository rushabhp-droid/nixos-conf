{ config, lib, ... }:

{
  options.sys.hm.wleave.enable = lib.mkEnableOption "wleave";

  config = lib.mkIf config.sys.hm.wleave.enable {
    xdg.configFile."wleave/layout".text = ''
      {
          "lock": {
              "label": "lock",
              "action": "hyprlock",
              "text": "Lock",
              "keybind": "l"
          },
          "hibernate": {
              "label": "hibernate",
              "action": "systemctl hibernate",
              "text": "Hibernate",
              "keybind": "h"
          },
          "logout": {
              "label": "logout",
              "action": "uwsm stop",
              "text": "Logout",
              "keybind": "e"
          },
          "shutdown": {
              "label": "shutdown",
              "action": "systemctl poweroff",
              "text": "Shutdown",
              "keybind": "s"
          },
          "suspend": {
              "label": "suspend",
              "action": "systemctl suspend",
              "text": "Suspend",
              "keybind": "u"
          },
          "reboot": {
              "label": "reboot",
              "action": "systemctl reboot",
              "text": "Reboot",
              "keybind": "r"
          }
      }
    '';

    xdg.configFile."wleave/style.css".text = ''
      window {
          background-color: alpha(#${config.lib.stylix.colors.base00}, 0.8);
      }

      button {
          background-color: #${config.lib.stylix.colors.base01};
          color: #${config.lib.stylix.colors.base05};
          border: 2px solid #${config.lib.stylix.colors.base02};
          border-radius: 10px;
          margin: 10px;
          padding: 20px;
          font-family: "${config.stylix.fonts.monospace.name}";
          font-size: 24px;
      }

      button:hover {
          background-color: #${config.lib.stylix.colors.base02};
          border: 2px solid #${config.lib.stylix.colors.base0D};
      }
    '';
  };
}
