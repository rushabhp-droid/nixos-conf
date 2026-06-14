# home.nix
{ config, pkgs, ... }:

let
  colors = config.lib.stylix.colors;
in
{
  # If you are using Sherlock's Home Manager module:
  programs.sherlock = {
    enable = true;
  };

  # Manually generate Sherlock's CSS using Stylix's Base16 colors
  xdg.configFile."sherlock/main.css".text = ''
    /* Base Window */
    window {
      background-color: #${colors.base00};
      color: #${colors.base05};
      font-family: "JetBrainsMono Nerd Font";
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
}
