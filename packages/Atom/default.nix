{ stdenv, fetchgit, cmake, root5, HepMC, gsl, FastJet, pkgconfig
, python, cython0192, libyamlcppPIC,  boost, YODA
# , Rivet
# , graphviz
# , doxygen 
}:
 
# Rivet,

stdenv.mkDerivation rec { 
  name = "Atom"; 
  version = "0.1";

  src = fetchgit { 
    url = "/home/wavewave/repo/srcc/Atom";
    rev = "4610c57f84663f6ca0a952817713dcfcbaa31ad1";
    sha256 = "c84ea36b48ac99049e2a2f3543103f1da49c31869a5a1516d8484b7e6d851d41";
  };
  patches = [ ./findYamlCpp.patch ./findROOT.patch ./noDoxygen.patch ./absolutePathInAtomenv.patch ]; # ./findHepMC.patch 

  buildInputs = [ cmake root5 HepMC gsl FastJet pkgconfig libyamlcppPIC 
                  python cython0192 boost YODA
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
