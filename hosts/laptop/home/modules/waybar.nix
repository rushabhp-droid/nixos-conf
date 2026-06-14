{config, pkgs, lib}:
{
  programs.waybar.enable = true;

  # Import your raw config and style files into the XDG directory
  xdg.configFile."waybar/config.jsonc".source = ./raw/waybar/config.jsonc;
  xdg.configFile."waybar/style.css".source = ./raw/waybar/style.css;

}
