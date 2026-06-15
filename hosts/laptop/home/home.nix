{ config, pkgs, ... }:
{
  imports = [ ./modules ];
  home.username = "rushabhp";
  home.homeDirectory = "/home/rushabhp";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    gh
    tokei
    devenv
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Rushabh Patil";
      user.email = "rushabhpatil3407@gmail.com";
    };
  };

  programs.gh = {
    enable = true;
    settings = {
      git_protocol = "https";
    };
  };

  programs.home-manager.enable = true;
}
