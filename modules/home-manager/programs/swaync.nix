{ lib, config, ... }: {
  options.homeModules.programs.swaync.enable = lib.mkEnableOption "swaync";
  config = lib.mkIf config.homeModules.programs.swaync.enable {

    services.swaync = {
      enable = true;
    };
  };
}
