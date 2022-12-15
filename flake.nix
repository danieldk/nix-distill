{
  description = "Experimental distillation pipelines";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in rec {
      packages = pkgs.callPackage ./default.nix {};
      devShells.default = pkgs.mkShell {
        packages = [
          (packages.python3.withPackages (
            ps: with ps; [ cupy curated-transformers ]
          ))
        ];
      };
    });
}
