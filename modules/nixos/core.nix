{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.sys.core.enable = lib.mkEnableOption "core";

  config = lib.mkIf config.sys.core.enable {
    # Bootloader
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

    # ZRAM SWAP
    zramSwap = {
      enable = true;
      memoryPercent = 50;
      algorithm = "zstd";
    };

    # Networking
    networking.networkmanager.enable = true;

    # Timezone and Locale
    time.timeZone = "Asia/Kolkata";
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
      font = "Lat2-Terminus16";
      keyMap = "us";
    };

    # Nix settings
    nixpkgs.config.allowUnfree = true;
    nix.settings = {
      substituters = [ "https://attic.xuyh0120.win/lantian" ];
      trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };

    # Environment packages
    environment.systemPackages = with pkgs; [
      git
      vim
      wget
      btop
    ];

    # SSH
    services.openssh.enable = true;

    system.stateVersion = "26.05";
  };
}
