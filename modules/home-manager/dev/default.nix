{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nil
    nixfmt
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

    jujutsu = {
      enable = true;
      settings = {
        user = {
          name = "Rushabh Patil";
          email = "rushabhpatil3407@gmail.com";
        };
      };
    };

    fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "nixos_small";
          padding = {
            right = 1;
          };
        };
        display = {
          size = {
            binaryPrefix = "si";
          };
          color = "blue";
          separator = "  ";
        };
        modules = [
          {
            type = "datetime";
            key = "Date";
            format = "{1}-{3}-{11}";
          }
          {
            type = "datetime";
            key = "Time";
            format = "{14}:{17}:{20}";
          }
          {
            type = "cpu";
            format = "{name} ({cores-physical}C/{cores-logical}T) @ {freq-max}";
          }
          {
            type = "gpu";
            key = "GPU";
          }
          "break"
          {
            type = "memory";
            key = "Memory";
            percent = {
              type = 3;
              green = 30;
              yellow = 70;
            };
          }
          "break"
          "player"
          "media"
        ];

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
      initExtra = "
      fastfetch
      ";
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
