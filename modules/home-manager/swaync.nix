{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.sys.hm.swaync.enable = lib.mkEnableOption "swaync";

  config = lib.mkIf config.sys.hm.swaync.enable {
    # Stylix automatically themes SwayNC based on your global settings
    stylix.targets.swaync.enable = true;

    services.swaync = {
      enable = true;

      settings = {
        positionX = "right";
        positionY = "top";
        control-center-margin-top = 10;
        control-center-margin-bottom = 10;
        control-center-margin-right = 10;
        control-center-margin-left = 10;
        control-center-width = 380;
        fit-to-screen = true;

        widgets = [
          "title"
          "buttons-grid"
          "volume"
          "dnd"
          "notifications"
        ];

        widget-config = {
          title = {
            text = "Control Center";
            clear-all-button = true;
            button-text = " 󰎟 ";
          };
          dnd = {
            text = "Do Not Disturb";
          };
          volume = {
            label = " ";
          };
          buttons-grid = {
            actions = [
              {
                label = "󰖁";
                command = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
              }
              {
                label = "󰖩";
                command = "alacritty -e nmtui";
              }
              {
                label = "󰂯";
                command = "blueman-manager";
              }
              {
                label = "󰆧";
                command = "sh -c 'grim -g \"$(slurp)\" - | wl-copy'";
              }
              {
                label = "󰀝";
                command = "rfkill toggle all";
              }
            ];
          };
        };
      };
    };
  };
}
