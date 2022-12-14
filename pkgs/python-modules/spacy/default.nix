{ fetchFromGitHub, spacy }:

spacy.overrideAttrs (attrs: {
  version = "distill-20221214";

  src = fetchFromGitHub {
    owner = "danieldk";
    repo = "spacy";
    rev = "55a1911b0777437b4eaef7d5f30f552794c66bf6";
    hash = "sha256-eEpmggZhhc939zujF+6m61sZlnHxSDvOkNqhTRUkgPM=";
  };
})
