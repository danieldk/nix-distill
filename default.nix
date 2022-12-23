{ pkgs ? import (fetchTarball https://github.com/danieldk/nixpkgs/archive/refs/heads/bugfix/wandb-git-logging.tar.gz) { } }:

rec {
  python3 = pkgs.python3.override {
    enableOptimizations = true;
    packageOverrides = import ./overlays/python.nix;
    self = python3;
  };
  python3Packages = python3.pkgs;

  spacy-distill =
    let
      py = python3.withPackages (ps:
        with ps; [ cupy curated-transformers ]
      );
    in
    py.overrideAttrs (attr: { meta.mainProgram = "spacy"; });
}
