{
  pkgs,
  stateVersion,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./disk-config.nix

    # Overlays
    ../../overlays
  ] ++ builtins.attrValues (import ../../modules/nixos);

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    tuxedo
  ];

  system.stateVersion = stateVersion;
}
