{ callPackage }:

rec {
  pathy = callPackage ./pathy { };

  spacy = callPackage ./spacy { };

  spacy-legacy = callPackage ./spacy-legacy { };
}
