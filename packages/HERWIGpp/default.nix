{ stdenv, fetchurl, gfortran, gsl, ThePEG, boost, FastJet }:
 
stdenv.mkDerivation rec { 
  name = "Herwig++-${version}"; 
  version = "2.7.0";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/herwig/Herwig++-2.7.0.tar.bz2";
    sha256 = "0cyarvdi2j99n4l330vvdw4fpy2p779dagk3j45npmz3wx43fh0p";
  };
  enableParallelBuilding = true; 
  buildInputs = [ gfortran gsl ThePEG boost FastJet ];
  configureFlags = "--with-thepeg=${ThePEG} --with-fastjet=${FastJet} ";
}
