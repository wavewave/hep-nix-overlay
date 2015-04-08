{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  name = "Minuit2-${version}";
  version = "5.34.14";
  src = fetchurl {
    url = "http://www.cern.ch/mathlibs/sw/5_34_14/Minuit2/Minuit2-5.34.14.tar.gz";
    sha256 = "0mn3m050m78mwmb7hks9z58zvs67fk5w8arj1960c5f3pf1s5a9c";
  };
  buildInputs = [ ];
  patches = [ ];
  enableParallelBuilding = true;
}
