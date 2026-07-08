{
  config,
  lib,
  pkgs,
  ...
}:
{
  options.homeModules.programs.multimedia.enable = lib.mkEnableOption "multimedia";
  config = lib.mkIf config.homeModules.programs.multimedia.enable {

    home.packages = with pkgs; [
      varia
      qbittorrent
      amberol
      stremio-linux-shell
      shortwave
      loupe # image viewer
      clapper # Media Player
      aria2
      ffmpeg
    ];

    programs = {
      yt-dlp = {
        enable = true;
        settings = {
          color = [
            "stdout:no_color"
            "stderr:always"
          ];
          downloader = "aria2c";
          downloader-args = "aria2c:'-c -x8 -s8 -k1M'";
          embed-subs = true;
          embed-thumbnail = true;
          sub-langs = "all";
        };
      };
    };
  };
}
