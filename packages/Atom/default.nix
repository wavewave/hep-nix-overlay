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
          
    rev = "f9b4ac425c3983e7179ef26b0e16b2ccdac09162";
    sha256 = "4e17e8ce7453be95ef470250671a587c8a26a7e737bf0fc1925d1b60e74297fc";
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
