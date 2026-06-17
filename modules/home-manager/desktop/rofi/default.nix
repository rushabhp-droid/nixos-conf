{ lib, ... }:
{
  options.sys.hm.rofi.enable = lib.mkEnableOption "rofi";

  imports = [
    ./theme.nix
    ./config.nix
  ];
}
