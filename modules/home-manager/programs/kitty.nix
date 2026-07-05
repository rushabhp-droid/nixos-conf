{ lib, config, ... }:

let
  # Pull the active Stylix color palette
  colors = config.lib.stylix.colors;
in
{
  options.homeModules.programs.kitty.enable = lib.mkEnableOption "kitty";
  config = lib.mkIf config.homeModules.programs.kitty.enable {

    # Disable Stylix's automatic Kitty theme to allow our custom mapping
    stylix.targets.kitty.enable = false;

    programs.kitty = {
      enable = true;

      # Inherit your dynamic system monospace font from Stylix
      font = {
        name = config.stylix.fonts.monospace.name;
        size = config.stylix.fonts.sizes.terminal;
      };

      settings = {
        # ---------------------------------------------------
        # Core Theme & Opacity
        # ---------------------------------------------------
        background = "#${colors.base00}";
        foreground = "#${colors.base05}";
        selection_background = "#${colors.base05}";
        selection_foreground = "#${colors.base00}";
        cursor = "#${colors.base05}";
        cursor_text_color = "#${colors.base00}";

        linux_display_server = "wayland";
        confirm_os_window_close = 0;

        # Matches the D9 (85%) opacity from your launcher setup
        background_opacity = config.stylix.opacity.terminal;

        # Adds breathing room around the text
        window_padding_width = 15;

        # ---------------------------------------------------
        # Titlebar & Window Aesthetics
        # ---------------------------------------------------
        # Tints the titlebar slightly lighter than the background
        wayland_titlebar_color = "#${colors.base01}";

        # If you ever port this config to Darwin (macOS), this applies the native look
        macos_titlebar_color = "#${colors.base01}";
        hide_window_decorations = "titlebar-only";

        tab_bar_min_tabs = 1;
        tab_bar_edge = "bottom";

        tab_bar_style = "powerline";
        tab_powerline_style = "slanted";

        active_tab_foreground = "#${colors.base00}";
        active_tab_background = "#${colors.base0D}";

        # Inactive segments get a subtle surface highlight
        inactive_tab_foreground = "#${colors.base05}";
        inactive_tab_background = "#${colors.base01}";

        # The empty space in the bar matches the terminal background
        tab_bar_background = "#${colors.base00}";

        # ---------------------------------------------------
        # Base16 Color Palette Mapping
        # ---------------------------------------------------
        # Black
        color0 = "#${colors.base00}";
        color8 = "#${colors.base03}";
        # Red
        color1 = "#${colors.base08}";
        color9 = "#${colors.base08}";
        # Green
        color2 = "#${colors.base0B}";
        color10 = "#${colors.base0B}";
        # Yellow
        color3 = "#${colors.base0A}";
        color11 = "#${colors.base0A}";
        # Blue
        color4 = "#${colors.base0D}";
        color12 = "#${colors.base0D}";
        # Magenta
        color5 = "#${colors.base0E}";
        color13 = "#${colors.base0E}";
        # Cyan
        color6 = "#${colors.base0C}";
        color14 = "#${colors.base0C}";
        # White
        color7 = "#${colors.base05}";
        color15 = "#${colors.base07}";
      };
    };
  };
}
