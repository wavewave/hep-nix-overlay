{ stdenv, fetchgit, cmake, root5, HepMC, gsl, FastJet, pkgconfig
, python, cython0192, libyamlcppPIC,  boost
# , Rivet
# , graphviz
# , doxygen 
}:
 
# Rivet,

stdenv.mkDerivation { 
  name = "Atom"; 
  version = "0.1";

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
  #enableParallelBuilding = true; 
  cmakeFlags = ''-DCMAKE_CXX_FLAGS=-fPIC  -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-undefined,dynamic_lookup"  -DCMAKE_VERBOSE_MAKEFILE=ON -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DBoost_NO_SYSTEM_PATHS=true  -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} -DUSE_BOOST_FILESYSTEM=OFF '';

  # 
  # -DCMAKE_SKIP_RPATH=FALSE -DCMAKE_SKIP_BUILD_RPATH=FALSE
  # -DMACOSX_RPATH
  # -DBoost_SYSTEM_LIBRARY=${boost}/lib/libboost_system.dylib -DBoost_FILESYSTEM_LIBRARY=${boost}/lib/libboost_filesystem.dylib
  meta = { 
    priority  = "9";
  };

}
