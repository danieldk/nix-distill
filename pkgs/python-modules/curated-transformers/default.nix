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
  version = "distill-20221214";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "explosion";
    repo = "curated-transformers";
    rev = "36fd6a36768c3bc9662993409ac3784ae5a34994";
    hash = "sha256-D3t+/1G45i6fCIF1EZ2vGNVEz0eaCqJcRkL8TevR7oQ=";
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