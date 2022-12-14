{ pkgs ? import (fetchTarball https://github.com/danieldk/nixpkgs/archive/refs/heads/bugfix/wandb-git-logging.tar.gz) { } }:

rec {
  python3 = pkgs.python3.override {
    packageOverrides = import ./overlays/python.nix;
  };
  python3Packages = python3.pkgs;
}
