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
  version = "distill-20221223";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "explosion";
    repo = "curated-transformers";
    rev = "11964bfae6c575988742c259bac6814517de9b55";
    hash = "sha256-qRDNu6KpHDmjAxjQRH/+Maoza886ziVBsUeBcwj5emw=";
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
