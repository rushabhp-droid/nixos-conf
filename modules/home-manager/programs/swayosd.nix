{ lib, config, ... }: {
  options.homeModules.programs.swayosd.enable = lib.mkEnableOption "swayosd";
  config = lib.mkIf config.homeModules.programs.swayosd.enable {

    services.swayosd.enable = true;
  };
}
