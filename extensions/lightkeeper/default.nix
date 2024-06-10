{ lib
, fetchFromGitHub
, buildGhidraExtension
}:
buildGhidraExtension {
  pname = "lightkeeper";
  version = "1.0.5";

  src = fetchFromGitHub {
    owner = "WorksButNotTested";
    repo = "lightkeeper";
    rev = "1.0.5";
    sha256 = "sha256-HgeO3FKxn+hfM/QMufrqKC1AIhlrRivMeB6GDFDg/Jc="; # lib.fakeSha256
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
