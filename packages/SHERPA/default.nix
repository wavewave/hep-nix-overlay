{ stdenv, fetchurl, gfortran }:
 
stdenv.mkDerivation { 
  name = "SHERPA"; 
  version = "2.0.0";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/sherpa/SHERPA-MC-2.0.0.tar.gz";
    sha256 = "0mv5p6d0zgif3iz5jwrwl2lbdchd59bp55ahm84l9kla2bmbb27a";
  };
  buildInputs = [ gfortran ];
  #configureFlags = "--with-thepeg=${ThePEG} --with-fastjet=${FastJet} ";
}
