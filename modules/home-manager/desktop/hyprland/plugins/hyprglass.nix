{
  lib,
  fetchFromGitHub,
  gnumake,
  hyprland,
  hyprlandPlugins,
}:
hyprlandPlugins.mkHyprlandPlugin (finalAttrs: {
  pluginName = "hyprglass";
  version = "main";

  src = fetchFromGitHub {
    owner = "hyprnux";
    repo = "hyprglass";
    rev = "main";
    hash = "sha256-coVoTJyRhn6eKZ8oJXus93p/G1gblgqcQNhNXBhx+G4=";
  };

  # any nativeBuildInputs required for the plugin
  nativeBuildInputs = [ gnumake ];

  # set any buildInputs that are not already included in Hyprland
  # by default, Hyprland and its dependencies are included
  buildInputs = [ ];

  # Override the default make install behavior
  installPhase = ''
    mkdir -p $out/lib
    cp hyprglass.so $out/lib/
  '';

  meta = {
    homepage = "https://github.com/hyprnux/hyprglass";
    description = "Hyprland plugin that add blur, lens, difraction, refraction effects to transparent windows. Inspired by Liquid Glass design";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.linux;
  };
})
