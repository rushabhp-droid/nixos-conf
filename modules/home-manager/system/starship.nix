{ lib, config, ... }:
{
  options.homeModules.system.starship.enable = lib.mkEnableOption "starship";
  config = lib.mkIf config.homeModules.system.starship.enable {

    programs.starship = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
