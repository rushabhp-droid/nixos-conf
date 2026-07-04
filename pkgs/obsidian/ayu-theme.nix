{ pkgs }:

pkgs.stdenv.mkDerivation {
  pname = "obsidian-ayu-theme";
  version = "main";
  src = pkgs.fetchFromGitHub {
    owner = "iodic";
    repo = "obsidian-ayu-theme";
    rev = "main";
    hash = "sha256-d0oumfSGhAsm7QGG9jaW3Iwekk26XQWV58Qlq8wNmL4=";
  };
  dontBuild = true;
  installPhase = ''
    mkdir -p $out
    cp theme.css manifest.json $out/
  '';
}
