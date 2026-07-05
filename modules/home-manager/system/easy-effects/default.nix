{ config, lib, ... }: {
  options.homeModules.system.easy_effects.enable = lib.mkEnableOption "easy_effects";
  config = lib.mkIf config.homeModules.system.easy_effects.enable {

    services = {
      easyeffects = {
        enable = true;
      };
    };
  };
}
