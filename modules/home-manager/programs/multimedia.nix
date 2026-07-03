{pkgs, ...}:
{
  home.packages = with pkgs; [
    amberol
    losange
    shortwave
  ];
}
