{ fetchFromGitHub, spacy }:

spacy.overrideAttrs (attrs: rec {
  name = "${attrs.pname}-${version}";
  version = "distill-20221223";

  src = fetchFromGitHub {
    owner = "danieldk";
    repo = "spacy";
    rev = "20a76acfe08415cf244f317fa07c98a6b5155bad";
    hash = "sha256-Nb1pRzrQL9r9jl8RMeCwZTEFYm9txzRaayX3wUxrxuo=";
  };
})
