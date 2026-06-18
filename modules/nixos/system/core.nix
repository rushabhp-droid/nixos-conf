{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
let
  username = "rushabhp";
in
{
  options.sys.core.enable = lib.mkEnableOption "core";

  config = lib.mkIf config.sys.core.enable {
    # Bootloader
    boot = {
      loader.systemd-boot.enable = true;
      loader.efi.canTouchEfiVariables = true;
      kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
    };

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

    # Pin flake registry and nix-path to the system nixpkgs
    nix = {
      registry.nixpkgs.flake = inputs.nixpkgs;
      nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      settings = {
        substituters = [ "https://attic.xuyh0120.win/lantian" "https://hyprland.cachix.org" ];
        trusted-substituters = [ "https://attic.xuyh0120.win/lantian" "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc=" "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        auto-optimise-store = true;
      };
    };

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 7d --keep 3";
      flake = "/home/${username}/nixos-conf";
    };

    # Environment packages
    environment.systemPackages = with pkgs; [
      git
      vim
      wget
      btop
      unrar

      # Desktop Packages
      google-antigravity-ide
    ];

    # SSH
    services.openssh.enable = true;

    system.stateVersion = "26.05";
  };
}
