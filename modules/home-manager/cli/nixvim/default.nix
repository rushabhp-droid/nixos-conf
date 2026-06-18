{
  lib,
  config,
  inputs,
  ...
}:
{
  options.sys.hm.nixvim.enable = lib.mkEnableOption "nixvim";

  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./core/options.nix
    ./core/keymaps.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/notes.nix
    ./plugins/markdown.nix
    ./plugins/ui.nix
    ./plugins/lsp.nix
  ];

  config = lib.mkIf config.sys.hm.nixvim.enable {
    programs.nixvim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
