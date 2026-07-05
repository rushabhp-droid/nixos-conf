{
  config,
  lib,
  pkgs,
  userName,
  ...
}:
{
  options.hostModules.core.users.enable = lib.mkEnableOption "users";
  config = lib.mkIf config.hostModules.core.users.enable {

    users.users.${userName} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "video"
        "audio"
        "libvirtd"
        "librepods"
      ];
      packages = with pkgs; [ ];
    };

    security.sudo = {
      enable = true;
      execWheelOnly = true;
      extraConfig = ''
        Defaults pwfeedback, insults
      '';
    };
  };
}
