{ config, lib, ... }:
{
  options.homeModules.dev.zellij.enable = lib.mkEnableOption "zellij";
  config = lib.mkIf config.homeModules.dev.zellij.enable {
    programs.zellij = {
      enable = true;
    };
  };
}
