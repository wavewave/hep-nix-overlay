{ stdenv, fetchgit, pkgs, cmake, root5, HepMC, gsl, FastJet, pkgconfig
, python, cython0192, libyamlcppPIC,  boost, YODA, gtest
}:
 
let pythonWithCython = pkgs.pythonFull.override { 
                         extraLibs = [ cython0192 ]; 
                       }; 
in stdenv.mkDerivation rec { 
  name = "Atom-${version}"; 
  version = "0.1";

  src = fetchgit { 
    url = "/Users/iwkim/repo/srcc/Atom";
          # "/afs/cern.ch/user/i/ikim/repo/srcc/Atom"; 
          
    rev = "7f1b6997cda658f4b7e0f6bb03b9c23a5820aa1b";
    sha256 = "1e260f14266a36b0c2f2f9529d1d21932e764052ee623fffb5434b14084fee32";
  };
  patches = [ ./findYamlCpp.patch ./findROOT.patch ./noDoxygen.patch ./absolutePathInAtomenv.patch ]; 

  buildInputs = [ cmake root5 HepMC gsl FastJet pkgconfig libyamlcppPIC 
                  pythonWithCython boost YODA gtest
                ] ++ (if (!stdenv.isDarwin) then [stdenv.gcc.libc] else []);
  pkgconfigDepends = [ libyamlcppPIC ] ;
  enableParallelBuilding = true; 


  preConfigure = '' 
 
    substituteInPlace bin/atomenv.sh --subst-var prefix
    substituteInPlace bin/atomenv.csh --subst-var prefix 

''; 

  cmakeFlags = if ( stdenv.isDarwin ) then
    ''-DCMAKE_CXX_FLAGS=-fPIC  -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-undefined,dynamic_lookup"  -DCMAKE_VERBOSE_MAKEFILE=ON -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DBoost_NO_SYSTEM_PATHS=true  -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} -DUSE_BOOST_FILESYSTEM=OFF ''
               else ''-DCMAKE_CXX_FLAGS=-fPIC  -DCMAKE_VERBOSE_MAKEFILE=ON -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DBoost_NO_SYSTEM_PATHS=true  -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} -DUSE_BOOST_FILESYSTEM=OFF '';
 
  meta = { 
  };

}

  # Necessary to find libdl (for linux)
  # dlpath = if ( !stdenv.isDarwin ) then "${stdenv.gcc.libc}" else "";
    # substituteInPlace CMakeModules/FindROOT.cmake --subst-var dlpath 
