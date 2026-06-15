{
  description = "A highly professional NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    cardwire = {
      url = "github:opengamingcollective/cardwire";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-cachyos-kernel,
      home-manager,
      stylix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        twin = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };

          modules = [
            # Core system configuration
            ./hosts/laptop/configuration.nix

            # Additional external modules
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager

            # System-wide overlays
            ({ pkgs, ... }: {
              nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ];
            })

            # Home Manager global setup
            ({ config, ... }: {
              home-manager = {
                useGlobalPkgs = false;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.rushabhp = ./hosts/laptop/home/home.nix;
              };
            })
          ];
        };
      };
    };
}
