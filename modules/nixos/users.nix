{ config, pkgs, ... }:
{
  security.sudo.extraConfig = ''
    Defaults pwfeedback, insults
  '';

  programs.zsh.enable = true;

  users.users.rushabhp = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "gamemode"
    ];
    packages = with pkgs; [
      tree
      nixfmt
      fastfetch
    ];
  };
}
