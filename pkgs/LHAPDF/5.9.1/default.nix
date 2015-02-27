{ stdenv, fetchurl, gfortran, python, swig }:
 
stdenv.mkDerivation rec { 
  name = "LHAPDF-${version}"; 
  version = "5.9.1";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/lhapdf/lhapdf-5.9.1.tar.gz";
    sha256 = "174ihr8cz02h4acdw65f9cprfd2m3kplfs5b5b72fmpjsx3b1fc6";
  };
  enableParallelBuilding = true;
  patches = [./use_cxx.patch];
 
  buildInputs = if (stdenv.isDarwin) then [ gfortran python ] else [ gfortran python swig ];
   
  # configureFlags = "--without-HepMC";
}

