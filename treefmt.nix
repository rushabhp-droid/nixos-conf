_: {
  projectRootFile = "flake.nix";

  programs = {
    # Format Nix files
    nixfmt.enable = true;

    # Nix Linters
    statix.enable = true;
    deadnix.enable = true;
  };
}
