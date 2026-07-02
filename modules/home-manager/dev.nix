{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil
    nixfmt
    helix
    devenv
    bat
    fzf
  ];


programs = {

  git = {
    enable = true;

    config = {
      user = {
	name = "Rushabh Patil";
	email = "rushabhpatil3407@gmail.com";
      };
    };

  };

  bat = {
    enable = true;
  };

  helix = {
    enable = true;

    settings = {
      editor = {
        line-number = "relative";
      };
    };
  };
  };
}
