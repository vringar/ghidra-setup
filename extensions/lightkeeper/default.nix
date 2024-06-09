{ fetchFromGitHub
, buildGhidraExtension
}:
buildGhidraExtension {
  pname = "lightkeeper";
  version = "1.0.2";

  src = fetchFromGitHub {
    owner = "WorksButNotTested";
    repo = "lightkeeper";
    rev = "1.0.2";
    sha256 = "sha256-P+6lNhuHrXUfZ+1UZ2dxzdbM0pdE6q8Yi4mdcMFqumk=";
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
