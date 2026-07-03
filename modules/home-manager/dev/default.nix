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
    gh = {
      enable = true;

      settings = {
        git_protocol = "https";
      };
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "Rushabh Patil";
          email = "rushabhpatil3407@gmail.com";
        };
      };
    };

    mcfly = {
      enable = true;
      enableBashIntegration = true;
    };

    bat = {
      enable = true;
    };

    bash = {
      enable = true;
      enableCompletion = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableBashIntegration = true;
    };

    lazygit = {
      enable = true;
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
