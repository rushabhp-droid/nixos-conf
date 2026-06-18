{
  description = "A highly professional NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
    };
  };

  outputs =
    inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };

      # Evaluate treefmt
      treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix;

      # Evaluate pre-commit hooks
      preCommitCheck = inputs.git-hooks.lib.${system}.run {
        src = ./.;
        hooks = {
          treefmt = {
            enable = true;
            package = treefmtEval.config.build.wrapper;
          };
        };
      };
    in
    {
      # Expose formatter for `nix fmt`
      formatter.${system} = treefmtEval.config.build.wrapper;

      # Expose checks for `nix flake check`
      checks.${system} = {
        formatting = treefmtEval.config.build.check inputs.self;
        pre-commit-check = preCommitCheck;
      };

      # Expose dev shell for `nix develop`
      devShells.${system}.default = pkgs.mkShell {
        inherit (preCommitCheck) shellHook;
        buildInputs = [ ];
      };

      nixosConfigurations = {
        twin = inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };

          modules = [
            # Core system configuration
            ./hosts/laptop/configuration.nix

            # Additional external modules
            inputs.sops-nix.nixosModules.sops
            inputs.disko.nixosModules.disko
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager

            # System-wide overlays
            ./overlays

            # Home Manager global setup
            {
              home-manager = {
                useGlobalPkgs = false;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.rushabhp = ./hosts/laptop/home/home.nix;
              };
            }
          ];
        };
      };
    };
}
