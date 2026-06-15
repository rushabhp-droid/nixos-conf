{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.sys.hm.waybar.enable = lib.mkEnableOption "waybar";

  config = lib.mkIf config.sys.hm.waybar.enable {
    # Allow Stylix to theme Waybar
    stylix.targets.waybar.enable = true;

    programs.waybar = {
      enable = true;

      # 2. Define the Layout (The "Pill")
      settings = {
        mainBar = {
          layer = "top";
          position = "top";

          modules-left = [
            "hyprland/window"
          ];

          modules-center = [
            "hyprland/workspaces"
            "battery"
          ];
          modules-right = [
            "network"
            "cpu"
            "temperature"
            "pulseaudio"
            "backlight"
            "clock"
          ];

          "hyprland/workspaces" = {
            format = "{name}";
            disable-scroll = true;
            all-outputs = true;
          };

          "battery" = {
            # Using Nerd Font icons for the battery indicator
            format = "{icon}";
            format-charging = "";
            format-plugged = "";
            format-icons = [
              "󰂎"
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            states = {
              warning = 30;
              critical = 15;
            };
          };

          "network" = {
            "format-wifi" = "  {signalStrength}%";
            "format-ethernet" = "󰈀  {ipaddr}";
            "format-disconnected" = "󰖪";
            "tooltip-format" = "{ifname} via {gwaddr} 󰊗";
          };

          "cpu" = {
            "format" = "  {usage}%";
            "tooltip" = false;
          };

          "temperature" = {
            "critical-threshold" = 80;
            "format" = "{icon} {temperatureC}°C";
            "hwmon-path" = "/sys/class/hwmon/hwmon6/temp1_input";
            "format-icons" = [
              ""
              ""
              ""
            ];
          };

          "pulseaudio" = {
            "format" = "{icon}  {volume}%";
            "on-click" = "hyprpwcenter";
            "format-muted" = "";
            "format-icons" = {
              "default" = [
                ""
                ""
                ""
              ];
            };
          };

          "backlight" = {
            "format" = "{icon} {percent}%";
            "format-icons" = [
              "󰃞"
              "󰃟"
              "󰃠"
            ];
          };

        };
      };

      # 3. Inject Stylix Colors into Custom CSS
      style = ''
        * {
          border: none;
          border-radius: 0;
          /* Automatically use your Stylix monospace font */
          font-family: "${config.stylix.fonts.monospace.name}"; 
          font-size: 15px;
          font-weight: bold;
        }

        /* Make the actual Waybar window invisible */
        window#waybar {
          background-color: transparent;
        }

        .modules-right {
          margin-right: 10px;
        }

        /* Style the center container to look like the pill */
        .modules-right
        .modules-center {
          /* Use your Stylix background color (base00) and append 'CC' for 80% opacity */
          background-color: alpha(#${config.lib.stylix.colors.base00}, 0.8);
          border-radius: 30px;
          padding: 4px 16px;
          margin-top: 12px;
          
          /* Optional: Add a subtle shadow for depth */
          box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.3);
        }

        /* Workspace Buttons */
        #workspaces button {
          /* Inactive workspaces use the muted base03 color */
          color: #${config.lib.stylix.colors.base03};
          padding: 2px 8px;
          margin: 0 4px;
          border-radius: 15px;
          transition: color 0.2s ease;
        }

        /* Active Workspace */
        #workspaces button.active {
          /* Active workspace uses your bright base05 text color */
          color: #${config.lib.stylix.colors.base05};
        }

        #workspaces button:hover {
          background: transparent;
          box-shadow: none;
          text-shadow: none;
          /* Accent color on hover */
          color: #${config.lib.stylix.colors.base0D}; 
        }

        /* Battery Icon */
        #battery {
          color: #${config.lib.stylix.colors.base05};
          padding: 2px 8px;
          margin-left: 8px;
        }

        /* Change battery icon to red when critical */
        #battery.critical {
          color: #${config.lib.stylix.colors.base08};
        }

        #network,
        #cpu,
        #temperature,
        #pulseaudio,
        #backlight,
        #clock {
          margin: 0 8px; /* Adds 8px of space on the left and right of each module */
        }
      '';
    };
  };
}
