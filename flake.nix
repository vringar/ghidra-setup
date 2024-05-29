{
  description = "A very basic flake";

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
              ret-sync
            ]);
        in
        with pkgs; {
          packages = {
            default = ghidraWithName;
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
