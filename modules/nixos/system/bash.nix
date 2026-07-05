{ lib, config, ... }:
{
  options.hostModules.system.bash.enable = lib.mkEnableOption "bash";
  config = lib.mkIf config.hostModules.system.bash.enable {

    environment.pathsToLink = [ "/share/bash-completion" ];
  };
}
