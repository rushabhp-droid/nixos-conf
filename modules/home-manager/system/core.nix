{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.sys.hm.core.enable = lib.mkEnableOption "core";

  config = lib.mkIf config.sys.hm.core.enable {

    home.packages = with pkgs; [
      gh
      kdePackages.okular
      qbittorrent
      tokei
      devenv
    ];

    programs.git = {
      enable = true;
      settings = {
        user.name = "Rushabh Patil";
        user.email = "rushabhpatil3407@gmail.com";
      };
    };

    programs.gh = {
      enable = true;
      settings = {
        git_protocol = "https";
      };
    };

    programs.home-manager.enable = true;
  };
}
