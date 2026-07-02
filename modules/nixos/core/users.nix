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
    ];
    packages = with pkgs; [
      tree
      fastfetch
    ];
  };
}
