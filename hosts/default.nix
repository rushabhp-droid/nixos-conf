{
  self,
  inputs,
  nixpkgs,
  home-manager,
  stylix,
  disko,
  sops-nix,
  system,
  ...
}:
{
  twin = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit self inputs; };

    modules = [
      # Core system configuration
      ./laptop/configuration.nix

      # Additional external modules
      sops-nix.nixosModules.sops
      disko.nixosModules.disko
      stylix.nixosModules.stylix
      home-manager.nixosModules.home-manager

      # System-wide overlays
      ../overlays

      # Home Manager global setup
      (_: {
        home-manager = {
          useGlobalPkgs = false;
          useUserPackages = true;
          extraSpecialArgs = { inherit self inputs; };
          users.rushabhp = ./laptop/home/home.nix;
        };
      })
    ];
  };
}
