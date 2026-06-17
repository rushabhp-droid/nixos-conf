{
  mainBar = {
    layer = "top";
    position = "top";

    modules-left = [
      "hyprland/window"
    ];

    modules-center = [
      "hyprland/workspaces"
      "mpris"
      "battery"
    ];

    modules-right = [
      "idle_inhibitor"
      "tray"
      "network"
      "bluetooth"
      "memory"
      "cpu"
      "temperature"
      "pulseaudio"
      "backlight"
      "clock"
    ];

    "hyprland/workspaces" = {
      format = "{name}";
      disable-scroll = true;
      all-outputs = true;
    };

    "battery" = {
      format = "{icon}";
      format-charging = "";
      format-plugged = "";
      format-icons = [
        "󰂎"
        "󰁺"
        "󰁻"
        "󰁼"
        "󰁽"
        "󰁾"
        "󰁿"
        "󰂀"
        "󰂁"
        "󰂂"
        "󰁹"
      ];
      states = {
        warning = 30;
        critical = 15;
      };
    };

    "network" = {
      format-wifi = "  {signalStrength}%";
      format-ethernet = "󰈀  {ipaddr}";
      format-disconnected = "󰖪";
      tooltip-format = "{ifname} via {gwaddr} 󰊗";
    };

    "cpu" = {
      format = "  {usage}%";
      tooltip = false;
    };

    "memory" = {
      format = " {}%";
    };

    "temperature" = {
      critical-threshold = 80;
      format = "{icon} {temperatureC}°C";
      hwmon-path-abs = "/sys/devices/platform/coretemp.0/hwmon";
      input-filename = "temp1_input";
      format-icons = [
        ""
        ""
        ""
      ];
    };

    "pulseaudio" = {
      format = "{icon}  {volume}%";
      on-click = "hyprpwcenter";
      format-muted = "";
      format-icons = {
        default = [
          ""
          ""
          ""
        ];
      };
    };

    "backlight" = {
      format = "{icon} {percent}%";
      format-icons = [
        "󰃞"
        "󰃟"
        "󰃠"
      ];
    };

    "tray" = {
      icon-size = 15;
      spacing = 10;
    };

    "bluetooth" = {
      format = " {status}";
      format-disabled = "󰂲";
      format-connected = "󰂱 {num_connections}";
      tooltip-format = "{controller_alias}\t{controller_address}";
      tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{device_enumerate}";
      tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
    };

    "idle_inhibitor" = {
      format = "{icon}";
      format-icons = {
        activated = "";
        deactivated = "";
      };
    };

    "mpris" = {
      format = "{player_icon} {dynamic}";
      format-paused = "{status_icon} <i>{dynamic}</i>";
      player-icons = {
        default = "▶";
        spotify = "";
        firefox = "";
      };
      status-icons = {
        paused = "⏸";
      };
    };
  };
}
