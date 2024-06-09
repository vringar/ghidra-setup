{ lib
, fetchFromGitHub
, buildGhidraExtension
}:
buildGhidraExtension {
  pname = "lightkeeper";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "vringar";
    repo = "lightkeeper";
    rev = "master";
    sha256 = "sha256-NPSU1pY3qWfUTq5s3vpe1G4EHDu2sAqmZ3oROT/bY/s=";
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
