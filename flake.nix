{
  description = "A falke to build Ghidra with all plugins required for reversing and fuzzing the AMD PSP";

  inputs = {
    nixpkgs.url = "github:vringar/nixpkgs/ghidra-ret-sync";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    let 
      out = system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          ghidraWithName = pkgs.callPackage ./package.nix { };
          ghidraWithExtensions = ghidraWithName.withExtensions
            (p: with p; [
              machinelearning
              sleighdevtools
              gnudisassembler
              ghidraninja-ghidra-scripts
              ret-sync
              lightkeeper
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
