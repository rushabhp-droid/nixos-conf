{ pkgs, ... }:
{
  home.packages = with pkgs; [
    amberol
    losange
    shortwave
    loupe # image viewer
    clapper # Media Player
  ];
}
