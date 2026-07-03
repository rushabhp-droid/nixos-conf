{pkgs, ...}:
{

  # AirPods Settings
  programs.librepods = {
    enable = true;
  };


  # Workaround for launching
  nixpkgs.overlays = [
    (final: prev: {
      librepods = prev.librepods.overrideAttrs (old: {
        postInstall = (old.postInstall or "") + ''
          # Wrap the binary to force the fallback theme and avoid the Wayland/GL crash
          wrapProgram $out/bin/librepods \
            --set QT_STYLE_OVERRIDE Fusion \
            --set WGPU_BACKEND vulkan
        '';
      });
    })
  ];

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
      };
    };
  };
}
