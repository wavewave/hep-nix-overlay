{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  name = "FastJet-${version}";
  version = "3.1.2";
  src = fetchurl {
    url = "http://fastjet.fr/repo/fastjet-3.1.2.tar.gz";
    sha256 = "02qp7h6njq0cd8fmadvghsnfdbhqbnfj804w8nncn8d87pjk9j6w";
  };
  enableParallelBuilding = true;
  configureFlags = "--enable-allcxxplugins";

  meta = {
  };
}
