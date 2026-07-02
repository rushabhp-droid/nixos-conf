{ pkgs, userName, ... }:
{
  users.users.${userName} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
    ];
    packages = with pkgs; [
      tree
      fastfetch
    ];
  };
}
