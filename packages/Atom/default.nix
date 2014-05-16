{ stdenv, fetchgit, pkgs, cmake, root5, HepMC, gsl, FastJet, pkgconfig
, python, cython0192, libyamlcppPIC,  boost, YODA, gtest
}:
 
let pythonWithCython = pkgs.pythonFull.override { 
                         extraLibs = [ cython0192 ]; 
                       }; 
in stdenv.mkDerivation rec { 
  name = "Atom-${version}"; 
  version = "0.9";

  src = fetchgit { 
    url = "/Users/iwkim/repo/srcc/Atom";
          # "/afs/cern.ch/user/i/ikim/repo/srcc/Atom"; 
          
    rev = "507bb01e46afb79da7246ae40fd8bd2a7f66de93";
    sha256 = "97149e20d1cc6432204467be2fbfe6123e3c9656588fdca7611d4ea5452c9c2b";
  };
  patches = [ ./findYamlCpp.patch ./findROOT.patch ./absolutePathInAtomenv.patch ]; 

  buildInputs = [ cmake root5 HepMC gsl FastJet pkgconfig libyamlcppPIC 
                  pythonWithCython boost YODA gtest
                ] ++ (if (!stdenv.isDarwin) then [stdenv.gcc.libc] else []);
  pkgconfigDepends = [ libyamlcppPIC ] ;
  enableParallelBuilding = true; 


  preConfigure = '' 
 
    substituteInPlace bin/atomenv.sh --subst-var prefix
    substituteInPlace bin/atomenv.csh --subst-var prefix 
    substituteInPlace bin/atom --replace /usr/bin/env ${pkgs.coreutils}/bin/env
    substituteInPlace bin/atom-config.in --replace /usr/bin/env ${pkgs.coreutils}/bin/env
    substituteInPlace bin/aida2root --replace /usr/bin/env ${pkgs.coreutils}/bin/env

''; 

  cmakeFlags = if ( stdenv.isDarwin ) then
    ''-DCMAKE_CXX_FLAGS=-fPIC  -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-undefined,dynamic_lookup"  -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DBoost_NO_SYSTEM_PATHS=true  -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} -DUSE_BOOST_FILESYSTEM=OFF -DENABLE_TESTS=true -DBUILD_DOCUMENTATION=OFF'' 
               else ''-DCMAKE_CXX_FLAGS=-fPIC  -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DBoost_NO_SYSTEM_PATHS=true  -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} -DUSE_BOOST_FILESYSTEM=OFF -DENABLE_TESTS=true -DBUILD_DOCUMENTATION=OFF'';
 
  meta = { 
  };

}

  # Necessary to find libdl (for linux)
  # dlpath = if ( !stdenv.isDarwin ) then "${stdenv.gcc.libc}" else "";
    # substituteInPlace CMakeModules/FindROOT.cmake --subst-var dlpath 
