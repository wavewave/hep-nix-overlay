{ stdenv, fetchurl, gfortran, gsl, ThePEG, boost, FastJet }:
 
stdenv.mkDerivation rec { 
  name = "Herwig++-${version}"; 
  version = "2.7.1";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/herwig/Herwig++-2.7.1.tar.bz2";
    sha256 = "1mkak9hixhag88x5c4204bc054ga01nffhjgwv25wpxndcvqk8c0" ; 
             # "0cyarvdi2j99n4l330vvdw4fpy2p779dagk3j45npmz3wx43fh0p";
  };
  enableParallelBuilding = true; 
  buildInputs = [ gfortran gsl ThePEG boost FastJet ];
  
  configureFlags = if stdenv.isDarwin
                   then "--with-thepeg=${ThePEG} --with-fastjet=${FastJet} CC=${stdenv.gcc}/bin/cc CXX=${stdenv.gcc}/bin/c++ "
                   else "--with-thepeg=${ThePEG} --with-fastjet=${FastJet}"; 
}
