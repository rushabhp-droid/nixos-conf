{
  config,
  pkgs,
  lib,
  ...
}:
{
  options.sys.fonts.enable = lib.mkEnableOption "fonts";

  config = lib.mkIf config.sys.fonts.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
