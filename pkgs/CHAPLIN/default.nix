{ stdenv, fetchurl, pkgs }:

stdenv.mkDerivation rec {
  name = "CHAPLIN-${version}";
  version = "1.2";
  src = fetchurl {
    url = "https://chaplin.hepforge.org/code/chaplin-1.2.tar";
    sha256 = "0jabdpbs2g2xza8mr538mx0ajgvd8585956yrqvcxr6lbyc2sz7i";
  };
  buildInputs = [ pkgs.gfortran ];
  enableParallelBuilding = true;

  meta = {
  };
}
