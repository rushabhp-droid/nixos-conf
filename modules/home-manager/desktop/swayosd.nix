{
  lib,
  config,
  ...
}:
{
  options.sys.hm.swayosd.enable = lib.mkEnableOption "swayosd";

  config = lib.mkIf config.sys.hm.swayosd.enable {
    services.swayosd = {
      enable = true;
    };
  };
}
