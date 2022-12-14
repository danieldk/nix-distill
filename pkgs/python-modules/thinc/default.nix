{ fetchFromGitHub, thinc }:

(thinc.overrideAttrs (attrs: {
  version = "with-flatten-v2";

  src = fetchFromGitHub {
    owner = "danieldk";
    repo = "thinc";
    rev = "37db76f1bca6a59b329d3b67275dc735de13ed44";
    hash = "sha256-FA0S5bqbHnS+pdPrrN4xfi0djofCAzNQ/1s8DgAq5IA=";
  };
}))
