{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
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

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
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

  };
  outputs =
    inputs@{
      nixpkgs,
      disko,
      auto-cpufreq,
      home-manager,
      stylix,
      cardwire,
      nixvim,
      ...
    }:
    let
      hostname = "netanyahu";
      userName = "rushabhp";
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs hostname userName; };
        modules = [

          # Declarative Disk config
          disko.nixosModules.disko

          # A GPU Manager
          cardwire.nixosModules.default

          # auto-cpufre
          auto-cpufreq.nixosModules.default

          # Stylix
          stylix.nixosModules.stylix

          ./hosts/${hostname}/configuration.nix

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs hostname userName; };
              users.${userName} = {
                imports = [

                  ./hosts/netanyahu/users/rushabhp/home.nix
                ];
              };
            };
          }
        ];
      };
    };
}
