{ lib, config, ... }:
{
  config = lib.mkIf config.sys.hm.nixvim.enable {
    programs.nixvim.plugins.treesitter = {
      enable = true;
      settings = {
        highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };
        indent = {
          enable = true;
        };
        ensure_installed = [
          "markdown"
          "markdown_inline"
          "nix"
          "bash"
          "python"
          "lua"
          "json"
          "yaml"
          "toml"
        ];
      };
    };
  };
}
