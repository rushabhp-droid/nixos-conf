{ lib, config, ... }:
{
  options.homeModules.programs.zathura.enable = lib.mkEnableOption "zathura";
  config = lib.mkIf config.homeModules.programs.zathura.enable {

    programs.zathura = {
      enable = true;
    };
  };
}
