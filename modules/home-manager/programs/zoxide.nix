{ lib, config, ... }:
{
  options.homeModules.programs.zoxide.enable = lib.mkEnableOption "zoxide";
  config = lib.mkIf config.homeModules.programs.zoxide.enable {

    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
