{ buildPythonPackage
, fetchFromGitHub
, pythonOlder
, cython
, cutlery
, pytorch-bin
, spacy
, srsly
, transformers
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "curated-transformers";
  version = "distill-20221217";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "explosion";
    repo = "curated-transformers";
    rev = "c164c908c2f7f1d7da383943f924ebb1ee54ad56";
    hash = "sha256-vuYLmQaDxI0VuWAPuRik0xLiJH5lUomq/nQK0gQUzZQ=";
  };

  nativeBuildInputs = [ cython ];

  propagatedBuildInputs = [
    cutlery
    pytorch-bin
    spacy
    srsly
    transformers
  ];

  checkInputs = [ pytestCheckHook ];

  pytestFlagsArray = [ "curated_transformers/" ];
}
