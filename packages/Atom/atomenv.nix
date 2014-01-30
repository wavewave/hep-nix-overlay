{ stdenv, fetchgit }:
 



stdenv.mkDerivation { 
  name = "Atom"; 
  version = "0.1";
  #src = fetchfile {
  #  pathname = ./Atom11f0efee302ba46ee9832c1bad2b947dac9f9712.tar.gz; 
  #  md5 = "88170ea4dae5ac640e57d0c263061c9f";
  #};

  src = fetchgit { 
    url = "/Users/iwkim/repo/srcc/Atom";
    rev = "11f0efee302ba46ee9832c1bad2b947dac9f9712";
    sha256 = "50e8d375777a916b63ecd38a7790534099d2a8befe9ee2d2d61fcc668651d443" ;
  };
  patches = [ ./findYamlCpp.patch ./findROOT.patch ./noDoxygen.patch ]; # ./findHepMC.patch 
  buildInputs = [ cmake root5 HepMC gsl FastJet pkgconfig libyamlcppPIC 
                  python cython0192 boost 
                # graphviz
                #  doxygen
                ];
  pkgconfigDepends = [ libyamlcppPIC ] ;
  # patches = [ ];
  cmakeFlags = ''-DCMAKE_CXX_FLAGS=-fPIC -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-undefined,dynamic_lookup"  -DCMAKE_VERBOSE_MAKEFILE=ON -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} '';

  meta = { 
    priority  = "9";
  };

}
