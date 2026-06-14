{ config, pkgs, ... }:
{
  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      nil
    ];
    settings = {
      theme = "amberwood";
    };
  };
}
