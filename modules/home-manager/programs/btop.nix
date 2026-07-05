{ lib, config, ... }: {
  options.homeModules.programs.btop.enable = lib.mkEnableOption "btop";
  config = lib.mkIf config.homeModules.programs.btop.enable {

    programs.btop.enable = true;
  };
}
