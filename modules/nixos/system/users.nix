{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.sys.users.enable = lib.mkEnableOption "users";

  config = lib.mkIf config.sys.users.enable {
    security.sudo.extraConfig = ''
      Defaults pwfeedback, insults
    '';

    programs.zsh.enable = true;

    users.users.rushabhp = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "networkmanager"
        "video"
        "gamemode"
      ];
      packages = with pkgs; [
        tree
        nixfmt
        fastfetch
      ];
    };
  };
}
