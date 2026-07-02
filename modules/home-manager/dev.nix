{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil
    nixfmt
    helix
    bat
    fzf
  ];

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "Rushabh Patil";
          email = "rushabhpatil3407@gmail.com";
        };
      };
    };

    bat = {
      enable = true;
    };

    direnv = {
      enable = true;
      nix-direnv = true;
      enableBashIntegration = true;
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
