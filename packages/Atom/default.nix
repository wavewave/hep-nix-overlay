{ stdenv, fetchgit, cmake, root5, HepMC, gsl, FastJet, pkgconfig
, python, cython0192, libyamlcppPIC,  boost, YODA, gtest
# , Rivet
# , graphviz
# , doxygen 
}:
 
# Rivet,

stdenv.mkDerivation rec { 
  name = "Atom"; 
  version = "0.1";

  src = fetchgit { 
    url = "/Users/iwkim/repo/srcc/Atom";
    rev = "a51ed234774beaa84b674579444f8cfac38366ec";
    sha256 = "0d741f2f7b8b10e2a1adf4156aeabc9c41d704faae23b0f1b8a22770c6a0a21f";
  };
  patches = [ ./findYamlCpp.patch ./findROOT.patch ./noDoxygen.patch ./absolutePathInAtomenv.patch ]; # ./findHepMC.patch 

  buildInputs = [ cmake root5 HepMC gsl FastJet pkgconfig libyamlcppPIC 
                  python cython0192 boost YODA gtest
                # graphviz
                #  doxygen
                ] ++ (if (!stdenv.isDarwin) then [stdenv.gcc.libc] else []);
  pkgconfigDepends = [ libyamlcppPIC ] ;
  enableParallelBuilding = true; 

  # Necessary to find libdl (for linux)
  dlpath = if ( !stdenv.isDarwin ) then "${stdenv.gcc.libc}" else "";


  preConfigure = '' 

    substituteInPlace bin/atomenv.sh --subst-var prefix
    substituteInPlace bin/atomenv.csh --subst-var prefix 
    substituteInPlace CMakeModules/FindROOT.cmake --subst-var dlpath 
''; 



  cmakeFlags = if ( stdenv.isDarwin ) then
    ''-DCMAKE_CXX_FLAGS=-fPIC  -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-undefined,dynamic_lookup"  -DCMAKE_VERBOSE_MAKEFILE=ON -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DBoost_NO_SYSTEM_PATHS=true  -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} -DUSE_BOOST_FILESYSTEM=OFF ''
               else ''-DCMAKE_CXX_FLAGS=-fPIC  -DCMAKE_VERBOSE_MAKEFILE=ON -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DBoost_NO_SYSTEM_PATHS=true  -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} -DUSE_BOOST_FILESYSTEM=OFF '';
 
  # 
  # -DCMAKE_SKIP_RPATH=FALSE -DCMAKE_SKIP_BUILD_RPATH=FALSE
  # -DMACOSX_RPATH
  # -DBoost_SYSTEM_LIBRARY=${boost}/lib/libboost_system.dylib -DBoost_FILESYSTEM_LIBRARY=${boost}/lib/libboost_filesystem.dylib
  meta = { 
    priority  = "9";
  };

}
