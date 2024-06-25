{ lib
, fetchFromGitHub
, buildGhidraExtension
}:
buildGhidraExtension {
  pname = "lightkeeper";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "WorksButNotTested";
    repo = "lightkeeper";
    rev = "1.1.0";
    sha256 = "sha256-S8yNn56A2CvrIBsq0RoBx0qOjrYDZSv1IVTxGmlL4Js="; # lib.fakeSha256;
  };
  preBuild = ''
    cd lightkeeper
  '';

  meta = {
    description = "A port of the Lighthouse plugin to GHIDRA.";
    homepage = "https://github.com/WorksButNotTested/lightkeeper";
    license = "unkown";
  };
}
