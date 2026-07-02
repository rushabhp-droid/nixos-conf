{ userName, ... }:

{
  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = "26.05";
  };

  imports = [ ../../../../modules/home-manager ];

  programs.home-manager.enable = true;
}
