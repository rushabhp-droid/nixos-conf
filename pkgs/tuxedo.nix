{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "tuxedo";
  version = "main";

  src = fetchFromGitHub {
    owner = "webstonehq";
    repo = "tuxedo";
    rev = version;
    hash = "sha256-ef6LYwUkaT8xEZ2KuJ7uVRdX8DSt32s8yPyXT/rKuuQ=";
  };

  cargoHash = "sha256-PIhtD0/0hxFOn51PwOWCtz82a2dvhS+2jbd8Wvr/JUM=";

  preCheck = ''
    export HOME=$(mktemp -d)
  '';

  meta = with lib; {
    description = "Tuxedo";
    homepage = "https://github.com/webstonehq/tuxedo";
    license = licenses.mit;
    maintainers = [ ];
  };
}
