_: {
  projectRootFile = "flake.nix";

  # Format Nix files
  programs.nixfmt.enable = true;

  # Format Lua files
  programs.stylua.enable = true;

  # Nix Linters
  programs.statix.enable = true;
  programs.deadnix.enable = true;
}
