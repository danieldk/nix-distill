self: super: {
  aiohttp = super.aiohttp.overrideAttrs (attrs: {
    doCheck = false;
    doInstallCheck = false;
  });

  scipy = super.scipy.overrideAttrs (attrs: {
    doInstallCheck = false;
  });

  blis = self.callPackage ../pkgs/python-modules/blis { inherit (super) blis; };

  curated-transformers = self.callPackage ../pkgs/python-modules/curated-transformers { };

  cutlery = self.callPackage ../pkgs/python-modules/cutlery { };

  eventlet = super.eventlet.overrideAttrs (attrs: {
    # Flaky, maybe with Python + optimizations?
    disabledTests = attrs.disabledTests ++ [ "test_fork_after_monkey_patch" ];
  });

  pathy = self.callPackage ../pkgs/python-modules/pathy { };

  sentry-sdk = super.sentry-sdk.overrideAttrs (attrs: {
    dontCheck = true;
  });

  spacy = self.callPackage ../pkgs/python-modules/spacy { inherit (super) spacy; };

  spacy-legacy = self.callPackage ../pkgs/python-modules/spacy-legacy { };

  thinc = self.callPackage ../pkgs/python-modules/thinc { inherit (super) thinc; };

  typer = super.typer.overrideAttrs (attrs: {
    # Multiple tests try to modify the same file.
    disabledTests = attrs.disabledTests ++ [ "test_install_completion" ];
  });
}
