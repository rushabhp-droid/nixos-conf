{ config, lib, ... }:
{
  options.homeModules.dev.helix.enable = lib.mkEnableOption "zellij";
  config = lib.mkIf config.homeModules.dev.zellij.enable {
    programs.zellij = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
