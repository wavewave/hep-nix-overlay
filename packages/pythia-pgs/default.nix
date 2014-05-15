{ pkgs, stdenv, fetchurl }:

with pkgs; 

stdenv.mkDerivation rec { 
  name = "pythia-pgs"; 
  version = "2.3.0";
  src = fetchurl { 
    url = " http://madgraph.hep.uiuc.edu/Downloads/pythia-pgs_V2.3.0.tar.gz";
    sha256 = "1rlngg5p25nmcnnc414c2j8hm9lnzahbwdmrj4idzf1k6ddlp2pj";
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
