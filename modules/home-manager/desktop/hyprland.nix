{
  config,
  lib,
  ...
}:
{
  options.sys.hm.hyprland.enable = lib.mkEnableOption "hyprland";

  config = lib.mkIf config.sys.hm.hyprland.enable {
    xdg.configFile."uwsm/env".source =
      "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";

    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
      systemd.variables = [ "--all" ];
      configType = "lua";

      settings = {
        on = import ./hyprland/autostart.nix { inherit config lib; };
        inherit ((import ./hyprland/general.nix { inherit lib; })) monitor;
        inherit ((import ./hyprland/general.nix { inherit lib; })) gesture;
        inherit ((import ./hyprland/general.nix { inherit lib; })) config;
        inherit ((import ./hyprland/animations.nix { inherit lib; })) curve;
        inherit ((import ./hyprland/animations.nix { inherit lib; })) animation;
        bind = import ./hyprland/binds.nix { inherit lib; };
        inherit ((import ./hyprland/rules.nix { inherit lib; })) window_rule;
        inherit ((import ./hyprland/rules.nix { inherit lib; })) workspace_rule;
        inherit ((import ./hyprland/rules.nix { inherit lib; })) layer_rule;
      };
    };
  };
}
