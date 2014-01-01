{ stdenv, fetchgit, cmake, root5, HepMC, gsl, FastJet, pkgconfig, 
  python, cython0192, libyamlcppPIC, Rivet, boost }:
 
stdenv.mkDerivation { 
  name = "Atom"; 
  version = "0.1";
  src = fetchgit { 
    url = "git@github.com:hep-soft/Atom.git";
    rev = "11f0efee302ba46ee9832c1bad2b947dac9f9712";
    sha256 = "50e8d375777a916b63ecd38a7790534099d2a8befe9ee2d2d61fcc668651d443" ;
  };
  patches = [ ./findYamlCpp.patch ];
  buildInputs = [ cmake root5 HepMC gsl FastJet pkgconfig libyamlcppPIC 
                  python cython0192 boost Rivet
                ];
  pkgconfigDepends = [ libyamlcppPIC ] ;
  # patches = [ ];
  cmakeFlags = "-DCMAKE_CXX_FLAGS=-fPIC -DCMAKE_VERBOSE_MAKEFILE=ON -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} ";

  meta = { 
    priority  = "9";
  };

}
