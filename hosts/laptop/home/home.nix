{ config, pkgs, ... }:
{
  imports = [ ./modules ];
  home.username = "rushabhp";
  home.homeDirectory = "/home/rushabhp";

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    gh
  ];
  
  programs.git = {
    enable = true;
    settings = {
      user.name = "Rushabh Patil";
      user.email = "rushabhpatil3407@gmail.com";

      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };
  };

  programs.home-manager.enable = true;
}
