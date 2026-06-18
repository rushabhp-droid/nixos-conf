{ lib, config, ... }:
{
  config = lib.mkIf config.sys.hm.nixvim.enable {
    programs.nixvim.plugins.render-markdown = {
      enable = true;
      settings = {
        heading = {
          sign = false;
          icons = [
            "󰲡 "
            "󰲣 "
            "󰲥 "
            "󰲧 "
            "󰲩 "
            "󰲫 "
          ];
        };
        code = {
          sign = false;
          width = "block";
          right_pad = 1;
        };
      };
    };
  };
}
