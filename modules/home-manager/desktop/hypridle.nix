{ lib, config, ... }: {
  options.homeModules.desktop.hypridle.enable = lib.mkEnableOption "hypridle";
  config = lib.mkIf config.homeModules.desktop.hypridle.enable {

    services.hypridle = {
      enable = true;

      settings = {
        general = {
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch 'hl.dsp.dpms({ action = 'enable' }')";
          ignore_dbus_inhibit = false;
          lock_cmd = "pidof hyprlock || hyprlock ";
        };
        listener = [
          {
            on-timeout = "brightnessctl -s set 10";
            on-resume = "brightnessctl -r";
            timeout = 150;
          }
          {
            timeout = 150; # 2.5min.
            on-timeout = "brightnessctl -sd rgb:kbd_backlight set 0";
            on-resume = "brightnessctl -rd rgb:kbd_backlight"; # turn on keyboard backlight.
          }
          {
            timeout = 300; # 5min
            on-timeout = "loginctl lock-session"; # lock screen when timeout has passed
          }
          {
            timeout = 330; # 5.5min
            on-timeout = "hyprctl dispatch 'hl.dsp.dpms({ action = 'disable' })'"; # screen off when timeout has passed
            on-resume = "hyprctl dispatch 'hl.dsp.dpms({ action = 'enable' })' && brightnessctl -r"; # screen on when activity is detected after timeout has fired.
          }
          {
            on-timeout = "systemctl suspend";
            timeout = 1800;
          }
        ];
      };
    };
  };
}
