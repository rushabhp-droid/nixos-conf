{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.alacritty = {
    package = null;
    enable = true;
    settings = {
      font = {
        size = 14.0;
        normal = {
          family = "JetBrainsMono Nerd Font";
        };
      };
    };
  };
}
