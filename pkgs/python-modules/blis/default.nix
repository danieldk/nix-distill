{ fetchPypi, blis }:

(blis.overrideAttrs (attrs: rec {
  version = "0.7.9";
  
  src = fetchPypi {
    inherit (attrs) pname;
    inherit version;
    hash = "sha256-Ke9MJQB3hakP/C8Ks9O9O3XNLXhWqaSCt9DayNURoJ0=";
  };
}))
