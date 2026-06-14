{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.alacritty = {
    package = null;

    settings = {
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
        };
        size = 14.0;
      };
    };
  };
}
