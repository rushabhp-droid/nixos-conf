{
  config,
  lib,
  ...
}:
{
  options.sys.hm.alacritty.enable = lib.mkEnableOption "alacritty";

  config = lib.mkIf config.sys.hm.alacritty.enable {
    programs.alacritty = {
      package = null;
      enable = true;
    };
  };
}
