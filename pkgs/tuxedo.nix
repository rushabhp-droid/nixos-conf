{ lib, rustPlatform, fetchFromGitHub }:

rustPlatform.buildRustPackage rec {
  pname = "tuxedo";
  version = "main";

  src = fetchFromGitHub {
    owner = "webstonehq";
    repo = "tuxedo";
    rev = version;
    sha256 = lib.fakeSha256;
  };

  cargoSha256 = lib.fakeSha256;

  meta = with lib; {
    description = "Tuxedo";
    homepage = "https://github.com/webstonehq/tuxedo";
    license = licenses.mit;
    maintainers = [ ];
  };
}
