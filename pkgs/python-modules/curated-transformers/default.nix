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
  version = "distill-20221218";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "explosion";
    repo = "curated-transformers";
    rev = "0b7ecf4b6fcff409ee0a9258665b26725a35b276";
    hash = "sha256-6gy9ESYj00DHWJ726h81N8r6Lk30C8QUGUPVPIknCGE=";
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
