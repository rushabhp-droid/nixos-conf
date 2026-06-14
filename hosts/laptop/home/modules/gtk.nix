{ config, pkgs, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.whitesur-cursors;
    name = "WhiteSur Cursors";
    size = 16;
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.whitesur-icon-theme;
      name = "WhiteSur-dark";
    };

  };

}
