{
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ./disk-config.nix

    # NixOS System Modules
    ../../modules/nixos
  ];

  environment.systemPackages = with pkgs; [
    vim
    git
    btop
    wget
  ];

  system.stateVersion = "26.05"; # Did you read the comment?

}
