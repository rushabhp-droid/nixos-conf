{
  lib,
  config,
  pkgs,
  ...
}:

let
  # Import mkLiteral to prevent Nix from quoting Rasi values
  inherit (config.lib.formats.rasi) mkLiteral;

  # Pull the active Stylix color palette
  colors = config.lib.stylix.colors;
in
{
  options.homeModules.programs.rofi.enable = lib.mkEnableOption "rofi";
  config = lib.mkIf config.homeModules.programs.rofi.enable {

    # Disable the default Stylix Rofi theme so it doesn't overwrite your custom layout
    stylix.targets.rofi.enable = false;

    programs.rofi = {
      enable = true;

      # ---------------------------------------------------
      # Top-Level Options
      # ---------------------------------------------------
      # Automatically syncs with your Stylix monospace font
      font = "${config.stylix.fonts.monospace.name} 15";
      terminal = "${pkgs.kitty}/bin/kitty";
      cycle = true;

      # ---------------------------------------------------
      # extraConfig (Behavioral settings)
      # ---------------------------------------------------
      extraConfig = {
        show-icons = true;
        display-drun = "Applications";
        disable-history = false;
      };

      # ---------------------------------------------------
      # theme (Native Nix attribute set using Stylix colors)
      # ---------------------------------------------------
      theme = {
        "*" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#${colors.base05}"; # foreground
        };

        "window" = {
          # base00 is your background. We append D9 for the 85% opacity effect.
          background-color = mkLiteral "#${colors.base00}D9";
          border = mkLiteral "2px solid";
          border-color = mkLiteral "#${colors.base03}"; # outline
          padding = mkLiteral "30px";
          border-radius = mkLiteral "16px";
          width = mkLiteral "900px";
        };

        "mainbox" = {
          children = map mkLiteral [
            "inputbar"
            "listview"
          ];
          spacing = mkLiteral "20px";
        };

        "inputbar" = {
          background-color = mkLiteral "#${colors.base01}"; # surface highlight
          padding = mkLiteral "15px";
          border-radius = mkLiteral "10px";
          margin = mkLiteral "0px 0px 10px 0px";
          children = map mkLiteral [
            "prompt"
            "entry"
          ];
        };

        "prompt" = {
          text-color = mkLiteral "#${colors.base0D}"; # primary accent
          padding = mkLiteral "0px 10px 0px 0px";
          # Inherit Stylix font but explicitly make the prompt bold
          font = "${config.stylix.fonts.monospace.name} Bold 15";
        };

        "entry" = {
          placeholder = "Search...";
          text-color = mkLiteral "#${colors.base05}";
          placeholder-color = mkLiteral "#${colors.base04}"; # muted foreground
        };

        "listview" = {
          columns = 5;
          lines = 4;
          dynamic = true;
          layout = mkLiteral "vertical";
          flow = mkLiteral "horizontal";
        };

        "element" = {
          orientation = mkLiteral "vertical";
          padding = mkLiteral "15px";
          border-radius = mkLiteral "12px";
        };

        "element selected.normal" = {
          background-color = mkLiteral "#${colors.base0D}"; # primary accent background
          text-color = mkLiteral "#${colors.base00}"; # base00 text for high contrast
        };

        "element-icon" = {
          size = mkLiteral "64px";
          cursor = mkLiteral "inherit";
        };

        "element-text" = {
          horizontal-align = mkLiteral "0.5";
          cursor = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
      };
    };
  };
}
