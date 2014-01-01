{ stdenv, fetchgit, cmake, Rivet, root5, HepMC, gsl, FastJet, pkgconfig, 
  python, cython, libyamlcpp, boost }:
 
stdenv.mkDerivation { 
  name = "Atom"; 
  version = "0.1";
  src = fetchgit { 
    url = "git@github.com:hep-soft/Atom.git";
    rev = "11f0efee302ba46ee9832c1bad2b947dac9f9712";
    sha256 = "50e8d375777a916b63ecd38a7790534099d2a8befe9ee2d2d61fcc668651d443" ;
  };
  buildInputs = [ cmake Rivet root5 HepMC gsl FastJet pkgconfig libyamlcpp 
                  python cython boost 
                ];
  # patches = [ ];
  cmakeFlags = "-DCMAKE_CXX_FLAGS=-fPIC -DCMAKE_VERBOSE_MAKEFILE=ON";
}
