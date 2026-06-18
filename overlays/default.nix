{ inputs, ... }:
{
  # Centralized Overlays
  nixpkgs.overlays = [
    inputs.antigravity-nix.overlays.default
  ];
}
