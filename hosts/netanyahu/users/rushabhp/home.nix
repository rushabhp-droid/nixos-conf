{ userName, stateVersion, ... }:

{
  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    inherit stateVersion;
  };

  imports = [ ../../../../modules/home-manager ];

  programs.home-manager.enable = true;
}
