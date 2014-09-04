{ pkgs, stdenv, fetchurl }:

with pkgs; 

stdenv.mkDerivation rec { 
  name = "pythia-pgs-${version}"; 
  version = "2.4.0";
  src = fetchurl { 
    url = "http://ianwookim.org/public/MG5_aMC/pythia-pgs_V2.4.0.tar.gz";
    sha256 = "0kf337xn0carspwaafwc5mdgfg3kxr9hj9599hhxq3gacf3j51n7";
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
