{ buildPythonPackage
, fetchPypi
, pythonOlder
, cython
, regex
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "cutlery";
  version = "0.0.3";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iYB/tfFWgAGvcU945D+7iNP4kKKbIPWiCGiKGxP1dqM=";
  };

  nativeBuildInputs = [ cython ];

  propagatedBuildInputs = [ regex ];

  checkInputs = [ pytestCheckHook ];

  pytestFlagsArray = [ "tests/" ];
  
  # Prevent import of local cutlery.
  preCheck = ''
    mv cutlery/tests .
    rm -rf cutlery
  '';
}