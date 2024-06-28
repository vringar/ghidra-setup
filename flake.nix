{
  description = "A falke to build Ghidra with all plugins required for reversing and fuzzing the AMD PSP";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let 
      out = system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          ghidraWithName = pkgs.callPackage ./package.nix { };
          my_extensions = pkgs.callPackage ./extensions.nix {ghidra = ghidraWithName;};
          ghidraWithExtensions = ghidraWithName.withExtensions
            (p: with p; [
              machinelearning
              my_extensions.ret-sync
              my_extensions.lightkeeper
            ]);
        in
        with pkgs; {
          packages = {
            default = ghidraWithExtensions;
          };
          devShells.default = mkShell {
            buildInputs = [
              ghidraWithExtensions
            ];
          };
        };
    in 
    flake-utils.lib.eachDefaultSystem out ;
}
