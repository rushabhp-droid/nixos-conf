{
  lib,
  config,
  ...
}:
{
  options.sys.hm.waybar.enable = lib.mkEnableOption "waybar";

  config = lib.mkIf config.sys.hm.waybar.enable {
    programs.waybar = {
      enable = true;
      settings = import ./settings.nix;
      style = import ./style.nix { inherit config; };
    };
  };
}
