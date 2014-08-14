{ pkgs, stdenv, fetchurl }:

with pkgs; 

stdenv.mkDerivation rec { 
  name = "pythia-pgs"; 
  version = "2.4.0";
  src = fetchurl { 
    url = " http://madgraph.hep.uiuc.edu/Downloads/pythia-pgs_V2.4.0.tar.gz";
    sha256 = "0q6310hplw6wi249wdr8dk2m55qiha7x3hhgcxhypa8niq32np4a";
  };
  buildInputs = [ gfortran ];

  buildPhase = ''
    cd src ; make libpythia ; cd ../libraries/PGS4; make; make clean ; make ; cd ../.. ; make
  '';

  installPhase = ''
    cd .. 
    mkdir -p $out/share
    cp -a pythia-pgs $out/share/pythia-pgs
  '';

  meta = {
  };
}
