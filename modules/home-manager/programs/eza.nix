{ lib, config, ... }: {
  options.homeModules.programs.eza.enable = lib.mkEnableOption "eza";
  config = lib.mkIf config.homeModules.programs.eza.enable {

    programs.eza = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
