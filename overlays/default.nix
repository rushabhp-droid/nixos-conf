{ inputs, ... }:
{
  # Centralized Overlays
  nixpkgs.overlays = [
    inputs.nix-cachyos-kernel.overlays.pinned
    inputs.antigravity-nix.overlays.default
  ];
}
