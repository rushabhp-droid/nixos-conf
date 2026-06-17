{
  config,
  lib,
  pkgs,
  ...
}:

lib.mkIf config.sys.hm.rofi.enable {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    font = "JetBrainsMono Nerd Font 15.0";

    theme = "theme";

    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
    ];

    extraConfig = {
      show-icons = true;
      modi = "drun,run,window,calc,emoji";

      display-drun = "🚀 Apps";
      display-run = "🏃 Run";
      display-window = "🪟 Windows";
      display-calc = "🖩 Calc";
      display-emoji = "😀 Emoji";

      drun-display-format = "{icon} {name}";

      sidebar-mode = true;
      hide-scrollbar = true;
      disable-history = false;
      sort = true;
      sorting-method = "normal";
    };
  };
}
