{ userName, stateVersion, ... }:

{
  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    stateVersion = stateVersion;
  };

  imports = [ ../../../../modules/home-manager ];

  programs.home-manager.enable = true;
}
