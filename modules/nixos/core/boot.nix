{ pkgs, ... }: {
  boot = {
    loader = {
      limine.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "splash"
    ];
  };

  services.fstrim.enable = true;
}
