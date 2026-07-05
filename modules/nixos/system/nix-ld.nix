{ lib, config, ... }: {
  options.hostModules.system.nix_ld.enable = lib.mkEnableOption "nix_ld";
  config = lib.mkIf config.hostModules.system.nix_ld.enable {

    programs.nix-ld.enable = true;
  };
}
