# home.nix
{ config, pkgs, ... }:

let
  colors = config.lib.stylix.colors;
in
{
  # If you are using Sherlock's Home Manager module:
  programs.sherlock = {
    enable = true;

    launchers = [
      {
        name = "Weather";
        type = "weather";
        args = {
          # Set your desired city here
          location = "Nashik";

          # How often to fetch the weather in minutes (optional)
          update_interval = 60;
        };
        # Optional: Add an action to open the full forecast in your browser
        actions = [
          {
            name = "Show in Web";
            exec = "https://www.wttr.in/Nashik";
            icon = "sherlock-link";
            method = "web_launcher";
          }
        ];
      }
      {
        name = "Calculator";
        type = "calculation";
        args = {
          capabilities = [
            "calc.math"
            "calc.hex"
            "calc.oct"
            "calc.bin"
            "calc.currency"
            "calc.unit"
            "calc.time"
          ];
        };
      }
      {
        name = "Web Search";
        type = "web_search";
        args = {
          url = "https://duckduckgo.com/?q=%s";
        };
      }
    ];

    settings = {
      icon_size = 28;
      search_icon = true;
      use_base_css = true;
      opacity = 1.0;

      units = {
        lengths = "meter";
        weights = "kg";
      };

      binds = {
        up = "control-k";
        down = "control-j";
        modifier = "control";
      };
    };

    style = ''
      /* Base Window */
      window {
        background-color: #${colors.base00};
        color: #${colors.base05};
        font-family: "${config.stylix.fonts.sansSerif.name}";
      }

      /* Input Bar */
      entry {
        background-color: #${colors.base01};
        color: #${colors.base05};
        border: 1px solid #${colors.base02};
        border-radius: 8px;
      }

      entry:focus {
        border-color: #${colors.base0D}; /* Primary accent color */
      }

      /* Selected Items */
      listview > row:selected {
        background-color: #${colors.base02};
        color: #${colors.base05};
        border-radius: 6px;
      }

      /* Additional accents */
      .accent {
        color: #${colors.base0D};
      }

      .error {
        color: #${colors.base08};
      }
    '';

  };
}
