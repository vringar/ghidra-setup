{ lib
, fetchFromGitHub
, buildGhidraExtension
}:
buildGhidraExtension {
  pname = "lightkeeper";
  version = "1.0.5";

  src = fetchFromGitHub {
    owner = "vringar";
    repo = "lightkeeper";
    rev = "feat/color-fix";
    sha256 = "sha256-22MFJ9aYSiPvpXLiwdZVhxgERC9QjpO7EvHnblHJHFo="; # lib.fakeSha256;
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
