{ config, lib }:

[
  {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd("awww-daemon")
        end
      '')
    ];
  }
  {
    _args = [
      "hyprland.start"
      (lib.generators.mkLuaInline ''
        function()
          hl.exec_cmd('sh -c "sleep 0.5 && awww img ${config.stylix.image} --transition-type fade --transition-duration 2"')
        end
      '')
    ];
  }
]
