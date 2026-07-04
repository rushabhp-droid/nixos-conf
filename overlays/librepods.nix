_final: prev: {
  librepods = prev.librepods.overrideAttrs (old: {
    postInstall = (old.postInstall or "") + ''
      # Wrap the binary to force the fallback theme and avoid the Wayland/GL crash
      wrapProgram $out/bin/librepods \
        --set QT_STYLE_OVERRIDE Fusion \
        --set WGPU_BACKEND vulkan
    '';
  });
}
