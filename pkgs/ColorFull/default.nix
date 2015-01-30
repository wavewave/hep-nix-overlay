{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ColorFull-${version}";
  version = "0.99";
  src = fetchurl {
    url = "http://colorfull.hepforge.org/ColorFull-0.99.tar.gz";
    sha256 = "1wdvg3kmn1xb9gppg9al7x2h9iw4la7xqml2hn1fi4v9bvf8by6v";
  };
  enableParallelBuilding = false;

  meta = {
  };
}
