{ lib
, fetchPypi
, buildPythonPackage
}:

buildPythonPackage rec {
  pname = "spacy-legacy";
  version = "3.0.10";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-FhBFldirG3Jn+BekSa0fmG6x8qLt8QUHSPCHOaR5Z5o=";
  };

  # checkInputs = [ pytestCheckHook spacy ];
  doCheck = false;
  pythonImportsCheck = [ "spacy_legacy" ];

  meta = with lib; {
    description = "Legacy spaCy registered functions";
    homepage = "https://github.com/explosion/spacy-legacy";
    license = licenses.asl20;
    maintainers = with maintainers; [ melling ];
  };
}
