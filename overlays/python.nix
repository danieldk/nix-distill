self: super: {
  blis = self.callPackage ../pkgs/python-modules/blis { inherit (super) blis; };

  curated-transformers = self.callPackage ../pkgs/python-modules/curated-transformers { };

  cutlery = self.callPackage ../pkgs/python-modules/cutlery { };

  pathy = self.callPackage ../pkgs/python-modules/pathy { };

  spacy = self.callPackage ../pkgs/python-modules/spacy { inherit (super) spacy; };

  spacy-legacy = self.callPackage ../pkgs/python-modules/spacy-legacy { };

  thinc = self.callPackage ../pkgs/python-modules/thinc { inherit (super) thinc; };
}
