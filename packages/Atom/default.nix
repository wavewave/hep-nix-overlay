{ stdenv, fetchgit, fetchfile, cmake, root5, HepMC, gsl, FastJet, pkgconfig, 
  python, cython0192, libyamlcppPIC,  boost, openssh }:
 
# Rivet,

stdenv.mkDerivation { 
  name = "Atom"; 
  version = "0.1";
  src = fetchfile {
    pathname = ./Atom11f0efee302ba46ee9832c1bad2b947dac9f9712.tar.gz; 
    md5 = "88170ea4dae5ac640e57d0c263061c9f";
  };

  #src = fetchgit { 
  #  url = "git@github.com:hep-soft/Atom.git";
  #  rev = "11f0efee302ba46ee9832c1bad2b947dac9f9712";
  #  sha256 = "50e8d375777a916b63ecd38a7790534099d2a8befe9ee2d2d61fcc668651d443" ;
  #  buildInputs = [ openssh ] ;
  #};
  patches = [ ./findYamlCpp.patch ];
  buildInputs = [ cmake root5 HepMC gsl FastJet pkgconfig libyamlcppPIC 
                  python cython0192 boost # Rivet
                ];
  pkgconfigDepends = [ libyamlcppPIC ] ;
  # patches = [ ];
  cmakeFlags = "-DCMAKE_CXX_FLAGS=-fPIC -DCMAKE_VERBOSE_MAKEFILE=ON -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} ";

  meta = { 
    priority  = "9";
  };

}
