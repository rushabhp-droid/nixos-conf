{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gh
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
}
