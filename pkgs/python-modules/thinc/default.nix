{ fetchFromGitHub, thinc }:

(thinc.overrideAttrs (attrs: rec {
  name = "${attrs.pname}-${version}";
  version = "9.0.0.dev1";

  src = fetchFromGitHub {
    owner = "explosion";
    repo = "thinc";
    rev = "v9.0.0.dev1";
    hash = "sha256-xKM0sKkMTamx/mNzzS0YTbcBn7Cn+lhheB3/cK8GFgs=";
  };
}))
