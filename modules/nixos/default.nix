_: {
  imports = [
    ../../overlays
    ./core
    ./desktop
    ./services/bluetooth.nix
    ./system/bash.nix
    ./system/stylix.nix
    ./services/virtualization.nix
    ./system/nix-ld.nix
    ./services/ssh.nix
    ./system/security.nix
    ./services/zram.nix
  ];
}
