{ stdenv, fetchurl, pkgs }:

stdenv.mkDerivation rec {
  name = "softsusy-${version}";
  version = "3.5.2";
  src = fetchurl {
    url = "http://www.hepforge.org/archive/softsusy/softsusy-3.5.2.tar.gz";
    sha256 = "06mm4yk2pg6qg00fzmi7a834yh6vv292qcvyksk3cyd1q1y93qvh";
  };
  buildInputs = [ pkgs.gfortran ];
  patches = [ ./remove_dupl_output.patch ];
  enableParallelBuilding = true;
}
