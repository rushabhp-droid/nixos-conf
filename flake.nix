{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    cardwire = {
      url = "github:opengamingcollective/cardwire";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        # IMPORTANT: To ensure compatibility with the latest Firefox version, use nixpkgs-unstable.
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs =
    inputs@{
      nixpkgs,
      disko,
      home-manager,
      stylix,
      treefmt-nix,
      ...
    }:
    let
      treefmtEval = treefmt-nix.lib.evalModule nixpkgs.legacyPackages.x86_64-linux {
        projectRootFile = "flake.nix";
        programs = {
          nixfmt.enable = true;
          stylua.enable = true;
        };
      };

      mkHost =
        hostname:
        {
          system ? "x86_64-linux",
          userName,
          stateVersion,
          wallpaper,
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit
              inputs
              hostname
              userName
              stateVersion
              wallpaper
              ;
          };
          modules = [
            # Declarative Disk config
            disko.nixosModules.disko

            # Stylix
            stylix.nixosModules.stylix

            ./hosts/${hostname}/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit
                    inputs
                    hostname
                    userName
                    stateVersion
                    ;
                };
                users.${userName} = {
                  imports = [
                    ./hosts/${hostname}/users/${userName}/home.nix
                  ];
                };
              };
            }
          ]
          ++ extraModules;
        };
    in
    {
      formatter.x86_64-linux = treefmtEval.config.build.wrapper;

      nixosConfigurations = builtins.mapAttrs mkHost {
        netanyahu = {
          userName = "rushabhp";
          stateVersion = "26.05";
          wallpaper = ./wallpapers/nix-gruvbox.png;
          extraModules = [
            # GPU Manager
            inputs.cardwire.nixosModules.default
            # auto-cpufreq
            inputs.auto-cpufreq.nixosModules.default
          ];
        };
      };
    };
}
