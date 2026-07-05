{ userName, stateVersion, ... }:

{
  home = {
    username = userName;
    homeDirectory = "/home/${userName}";
    inherit stateVersion;
  };

  imports = builtins.attrValues (import ../../../../modules/home-manager);

  programs.home-manager.enable = true;
}
