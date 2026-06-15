{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.sys.sops.enable = lib.mkEnableOption "sops";

  config = lib.mkIf config.sys.sops.enable {
    environment.systemPackages = [ pkgs.sops ];

    sops = {
      defaultSopsFile = ./secrets/secrets.yaml;
      defaultSopsFormat = "yaml";
      age.keyFile = "/home/rushabhp/.config/sops/age/keys.txt";
    };
  };
}
