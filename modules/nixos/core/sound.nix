{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.hostModules.core.sound.enable = lib.mkEnableOption "sound";
  config = lib.mkIf config.hostModules.core.sound.enable {

    environment.systemPackages = with pkgs; [
      helvum
    ];
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
  };
}
