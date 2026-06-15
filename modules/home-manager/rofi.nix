{
  config,
  lib,
  pkgs,
  ...
}:

let
  colors = config.lib.stylix.colors;

  # Inject Stylix colors and wallpaper into a literal RASI string
  rasiConfig = ''
    * {
        bg: #${colors.base00}e6;
        bg-alt: #${colors.base01}e6;
        bg-selected: #${colors.base0D}e6;
        fg: #${colors.base05};
        fg-alt: #${colors.base03};
        border-col: #${colors.base02};
        
        background-color: transparent;
        text-color: @fg;
        margin: 0px;
        padding: 0px;
        spacing: 0px;
    }

    window {
        width: 800px;
        border-radius: 15px;
        background-color: @bg;
        border: 2px solid;
        border-color: @border-col;
    }

    mainbox {
        orientation: horizontal;
        children: [ dummy, listbox ];
    }

    dummy {
        expand: false;
        width: 300px;
        background-image: url("${config.stylix.image}", height);
        border-radius: 15px;
        margin: 15px;
    }

    listbox {
        spacing: 10px;
        padding: 15px 15px 15px 0px;
        orientation: vertical;
        children: [ inputbar, message, listview ];
    }

    inputbar {
        padding: 10px;
        border-radius: 10px;
        background-color: @bg-alt;
        text-color: @fg;
        children: [ prompt, entry ];
    }

    prompt {
        text-color: @fg;
        padding: 0px 10px 0px 0px;
    }

    entry {
        text-color: @fg;
        placeholder: "Search...";
        placeholder-color: @fg-alt;
    }

    listview {
        columns: 1;
        lines: 6;
        cycle: true;
        dynamic: true;
        scrollbar: false;
        layout: vertical;
    }

    element {
        padding: 10px;
        border-radius: 10px;
        background-color: transparent;
        text-color: @fg;
    }

    element-icon {
        size: 24px;
        padding: 0px 10px 0px 0px;
        background-color: transparent;
    }

    element-text {
        vertical-align: 0.5;
        background-color: transparent;
        text-color: inherit;
    }

    element selected {
        background-color: @bg-selected;
        text-color: #${colors.base00};
    }
  '';
in
{
  options.sys.hm.rofi.enable = lib.mkEnableOption "rofi";

  config = lib.mkIf config.sys.hm.rofi.enable {
    # 1. Disable Stylix's auto-generated Rofi layout
    stylix.targets.rofi.enable = false;

    # 2. Write the custom RASI layout to the standard Rofi config directory
    xdg.configFile."rofi/theme.rasi".text = rasiConfig;

    programs.rofi = {
      enable = true;
      package = pkgs.rofi;
      # Force font because Stylix target is disabled, so we manage font natively
      font = "JetBrainsMono Nerd Font 15.0";

      # Tell Rofi to load the theme we wrote to ~/.config/rofi/theme.rasi
      theme = "theme";

      extraConfig = {
        show-icons = true;
        display-drun = "Applications";
        drun-display-format = "{icon} {name}";
        modi = "drun,run,window";
      };
    };
  };
}
