{ pkgs, ... }:
{
  # ── Steam ───────────────────────────────────────────────────────────
  programs.steam = {
    enable = true;
    # 32-bit library support (needed by many Proton titles)
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # ── Gamemode — on-demand CPU / GPU performance tuning ───────────────
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 10;
        softrealtime = "auto";
      };
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
      };
    };
  };

  # ── GameScope — micro-compositor for per-game display control ───────
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  # ── Extra gaming packages ───────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    mangohud # Vulkan/OpenGL overlay (FPS, temps, frame-times)
    protonup-qt # Manage GE-Proton / Proton-TKG versions
    heroic # Epic / GOG / Amazon launcher
    lutris # Multi-runner game manager
    bottles # Wine prefix manager
    winetricks # Wine helper scripts
    protontricks # Proton-specific winetricks wrapper
    prismlauncher # Minecraft Launcher
  ];
}
