{ stdenv, fetchurl, gfortran, python, swig }:
 
stdenv.mkDerivation { 
  name = "LHAPDF"; 
  version = "5.9.1";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/lhapdf/lhapdf-5.9.1.tar.gz";
    sha256 = "174ihr8cz02h4acdw65f9cprfd2m3kplfs5b5b72fmpjsx3b1fc6";
  };
  patches = [./use_cxx.patch];
  buildInputs = [ gfortran python swig ];
   
  # configureFlags = "--without-HepMC";
}

