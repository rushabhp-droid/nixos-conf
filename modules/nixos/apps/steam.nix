{
  config,
  lib,
  ...
}:
{
  options.sys.steam.enable = lib.mkEnableOption "steam";

  config = lib.mkIf config.sys.steam.enable {
    # Enable Steam and performance tweaks
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      # Enables Valve's Gamescope compositor utility for sandboxed resolution control
      gamescopeSession.enable = true;
    };
  };
}
