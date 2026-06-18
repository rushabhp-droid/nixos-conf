{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.sys.hm.vscodium.enable = lib.mkEnableOption "vscodium";

  config = lib.mkIf config.sys.hm.vscodium.enable {
    programs.vscodium = {
      enable = true;

      profiles.default.extensions = with pkgs.vscode-extensions; [
      ];
    };
  };
}
