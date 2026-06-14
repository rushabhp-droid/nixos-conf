{ pkgs, ... }:

{
  systemd.user.services.auto-refresh = {
    description = "Dynamically drop monitor refresh rate to 60Hz on battery";

    # Hooks seamlessly into the UWSM session manager hierarchy
    wantedBy = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];

    script = ''
            # Update this if your monitor is named differently in 'hyprctl monitors'
            MONITOR="eDP-1"
            
            STATE="unknown"
            
            while true; do
              # Safely check if the laptop battery is actively discharging
              if grep -q "Discharging" /sys/class/power_supply/BAT*/status 2>/dev/null; then
                CURRENT="bat"
              else
                CURRENT="ac"
              fi

              # If the power state changes, apply the new Hyprland parameters
              if [ "$CURRENT" != "$STATE" ]; then
                if [ "$CURRENT" = "ac" ]; then
                  # On AC: Use Hyprland's 'highrr' variable to automatically max out your refresh rate
      	   ${pkgs.hyprland}/bin/hyprctl eval "hl.monitor({ output = \"$MONITOR\", mode = \"highrr\", position = \"0x0\", scale = \"1\" })"
      	else
                  # On Battery: Lock the resolution to 1080p and refresh rate to 60Hz
      ${pkgs.hyprland}/bin/hyprctl eval "hl.monitor({ output = \"$MONITOR\", mode = \"1920x1080@60\", position = \"0x0\", scale = \"1\" })"
                fi
                STATE=$CURRENT
              fi
              
              sleep 5
            done
    '';
    serviceConfig = {
      Type = "simple";
      Restart = "always";
      RestartSec = "10";
    };
  };
}
