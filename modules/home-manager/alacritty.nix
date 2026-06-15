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
  };
}
