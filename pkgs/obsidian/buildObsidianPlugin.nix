{ pkgs, lib }:

{ pname, version, repo, rev, mainHash, manifestHash, stylesHash ? null }: pkgs.stdenv.mkDerivation {
  inherit pname version;

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out
    cp ${pkgs.fetchurl { url = "https://github.com/${repo}/releases/download/${rev}/main.js"; hash = mainHash; }} $out/main.js
    cp ${pkgs.fetchurl { url = "https://github.com/${repo}/releases/download/${rev}/manifest.json"; hash = manifestHash; }} $out/manifest.json
    ${lib.optionalString (stylesHash != null) ''
      cp ${pkgs.fetchurl { url = "https://github.com/${repo}/releases/download/${rev}/styles.css"; hash = stylesHash; }} $out/styles.css
    ''}
  '';
}
