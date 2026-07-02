{ config, pkgs, ... }:

let
  # Alias for easier access to Stylix colors
  colors = config.lib.stylix.colors.withHashtag;
in
{
  # Disable Stylix's default Waybar theming so it doesn't overwrite our custom layout
  stylix.targets.waybar.enable = false;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 0;

        modules-left = [
          "hyprland/workspaces"
          "custom/separator#left"
        ];
        
        modules-center = [];
        
        modules-right = [
          "custom/separator#1"
          "tray"
          "custom/separator#2"
          "network"
          "custom/separator#3"
          "battery"
          "custom/separator#4"
          "cpu"
          "custom/separator#5"
          "memory"
          "custom/separator#6"
          "disk"
          "custom/separator#7"
          "clock"
          "custom/separator#8"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          disable-scroll = true;
          all-outputs = true;
          on-click = "activate";
        };

        "custom/separator" = {
          format = "|";
          tooltip = false;
        };

        network = {
          format-wifi = "Online";
          format-ethernet = "Online";
          format-disconnected = "Offline";
          tooltip-format = "{ifname} via {gwaddr}";
        };

        battery = {
          format = "BAT: {capacity}%";
        };

        cpu = {
          format = "CPU: {usage}%";
          tooltip = false;
        };

        memory = {
          format = "Mem: {used:0.1f}GiB";
          tooltip = false;
        };

        disk = {
          interval = 30;
          format = "Disk: {used}";
          path = "/";
          tooltip = false;
        };

        clock = {
          format = "{:%H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        /* Dynamically use Stylix fonts */
        font-family: "${config.stylix.fonts.monospace.name}"; 
        font-size: ${toString config.stylix.fonts.sizes.desktop}px;
        min-height: 0;
      }

      window#waybar {
        background-color: ${colors.base00}; 
        color: ${colors.base05};
      }

      /* Hyprland Workspace Styling */
      #workspaces button {
        padding: 0 6px;
        background: transparent;
        color: ${colors.base05};
        border-bottom: 2px solid transparent;
      }

      #workspaces button.active {
        color: ${colors.base0C}; /* Cyan/Teal accent */
        border-bottom: 2px solid ${colors.base0C}; 
      }

      #workspaces button:hover {
        background: transparent;
        box-shadow: inherit;
        text-shadow: inherit;
      }

      /* Separator Styling */
      #custom-separator {
        color: ${colors.base03}; /* Muted grey/comment color */
        padding: 0 8px;
      }

      /* Right Module Base Styling */
      #network, #cpu, #memory, #disk, #clock, #battery {
        padding: 0 4px;
        margin: 0 2px;
        border-bottom: 2px solid transparent;
      }

      /* Dynamic Stylix Base16 Module Colors */
      #network {
        color: ${colors.base0D}; /* Blue */
        border-bottom-color: ${colors.base0D};
      }

      #cpu {
        color: ${colors.base0B}; /* Green */
        border-bottom-color: ${colors.base0B};
      }

      #memory {
        color: ${colors.base0E}; /* Purple */
        border-bottom-color: ${colors.base0E};
      }

      #disk {
        color: ${colors.base0A}; /* Yellow */
        border-bottom-color: ${colors.base0A};
      }

      #clock {
        color: ${colors.base0C}; /* Cyan/Teal */
        border-bottom-color: ${colors.base0C};
      }

      #battery {
        color: ${colors.base0E};
        border-bottom-color: ${colors.base0E};
      }
    '';
  };
}
