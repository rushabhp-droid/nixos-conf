{ config, pkgs, lib, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;
  fonts = config.stylix.fonts;
  obsidian-plugins = import ../../../pkgs/obsidian { inherit pkgs lib; };
in
{
  stylix.targets.obsidian.enable = false;
  programs.obsidian = {
    enable = true;
    vaults."Documents/Notes" = {
      enable = true;
      settings = {
        communityPlugins = with obsidian-plugins; [
          dataview
          templater
          calendar
          tasks
          style-settings
        ];
        themes = with obsidian-plugins; [
          ayu-theme
        ];
        app = {
          theme = "obsidian";
          cssTheme = "obsidian-ayu-theme";
        };
      };
    };
    defaultSettings = {
      app = {
        defaultViewMode = "preview";
        readableLineLength = true;
        showLineNumber = true;
        attachmentFolderPath = "./assets";
      };
    };
  };
}
