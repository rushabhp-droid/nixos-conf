{ config, pkgs, ... }:
{
  imports = [ ../../../../modules/home-manager ];

  home.username = "rushabhp";
  home.homeDirectory = "/home/rushabhp";
  home.stateVersion = "26.05";
}
