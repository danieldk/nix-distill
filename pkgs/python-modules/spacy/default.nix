{ fetchFromGitHub, spacy }:

spacy.overrideAttrs (attrs: {
  version = "distill-20221215";

  src = fetchFromGitHub {
    owner = "danieldk";
    repo = "spacy";
    rev = "865f6a156f7790e7d38ed72583cfbee19bc7dcf0";
    hash = "sha256-zXoxd5dAnvETyn9fmhEQ+6/pc4f4xSiTC/qXpIEuiOA=";
  };
})
