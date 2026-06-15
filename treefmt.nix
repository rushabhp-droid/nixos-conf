{ pkgs, ... }: {
  projectRootFile = "flake.nix";

  # Format Nix files
  programs.nixfmt.enable = true;

  # Format Lua files
  programs.stylua.enable = true;
}
