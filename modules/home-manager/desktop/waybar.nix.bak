{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
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
          "network"
          "custom/separator#2"
          "cpu"
          "custom/separator#3"
          "memory"
          "custom/separator#4"
          "disk"
          "custom/separator#5"
          "clock"
          "custom/separator#6"
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
        font-family: "JetBrainsMono Nerd Font", monospace; 
        font-size: 13px;
        min-height: 0;
      }

      window#waybar {
        background-color: #1a1b26; 
        color: #a9b1d6;
      }

      /* Hyprland Workspace Styling */
      #workspaces button {
        padding: 0 6px;
        background: transparent;
        color: #a9b1d6;
        border-bottom: 2px solid transparent;
      }

      #workspaces button.active {
        color: #2ac3de; 
        border-bottom: 2px solid #2ac3de; 
      }

      #workspaces button:hover {
        background: transparent;
        box-shadow: inherit;
        text-shadow: inherit;
      }

      /* Separator Styling */
      #custom-separator {
        color: #565f89; 
        padding: 0 8px;
      }

      /* Right Module Base Styling */
      #network, #cpu, #memory, #disk, #clock {
        padding: 0 4px;
        margin: 0 2px;
        border-bottom: 2px solid transparent;
      }

      /* Individual Module Colors */
      #network {
        color: #7aa2f7; 
        border-bottom-color: #7aa2f7;
      }

      #cpu {
        color: #9ece6a; 
        border-bottom-color: #9ece6a;
      }

      #memory {
        color: #bb9af7; 
        border-bottom-color: #bb9af7;
      }

      #disk {
        color: #e0af68; 
        border-bottom-color: #e0af68;
      }

      #clock {
        color: #2ac3de; 
        border-bottom-color: #2ac3de;
      }
    '';
  };
}
