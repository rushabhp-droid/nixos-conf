{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.sys.hm.helix.enable = lib.mkEnableOption "helix";

  config = lib.mkIf config.sys.hm.helix.enable {
    programs.helix = {
      enable = true;
      extraPackages = with pkgs; [
        nil
      ];
    };
  };
}
