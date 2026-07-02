{ pkgs, ... }:
{
  programs.wleave = {
    enable = true;

    package = null;

    settings = {
      show-keybinds = true;
      buttons = [
        {
          label = "lock";
          action = "hyprlock";
          text = "Lock";
          keybind = "l";
          icon = "${pkgs.wleave}/share/wleave/icons/lock.svg";
        }
        {
          label = "logout";
          action = "uwsm stop && loginctl terminate-user $USER";
          text = "Logout";
          keybind = "e";
          icon = "${pkgs.wleave}/share/wleave/icons/logout.svg";
        }
        {
          label = "restart";
          action = "systemctl reboot";
          text = "Restart";
          keybind = "r";
          icon = "${pkgs.wleave}/share/wleave/icons/reboot.svg";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
          icon = "${pkgs.wleave}/share/wleave/icons/shutdown.svg";
        }
      ];
    };
  };
}
