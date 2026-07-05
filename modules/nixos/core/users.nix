{ pkgs, userName, ... }:
{
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
    packages = with pkgs; [];
  };

  security.sudo = {
    enable = true;
    execWheelOnly = true;
    extraConfig = ''
      Defaults pwfeedback, insults
    '';
  };
}
