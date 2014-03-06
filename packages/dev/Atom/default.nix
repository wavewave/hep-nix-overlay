{ pkgs, stdenv, fetchgit, cmake, root5, HepMC, gsl, FastJet, pkgconfig
, cython0192, libyamlcppPIC, YODA
# , python
# ,  boost
# , gtest
# , Rivet
# , graphviz
# , doxygen 
}:
 
let pythonAtom = pkgs.pythonFull.override { 
      # extraLibs = with pkgs.pythonPackages; [ numpy scipy ];
    };
in pkgs.myEnvFun { 
  name = "atom-dev";

  buildInputs = with pkgs; [
    pythonAtom
    stdenv
  ];
  
  extraCmds = with pkgs; ''
    export PYTHONPATH=
    export LD_LIBRARY_PATH=
    unpack () { 
    }
    export -f unpack 
  '';
}

#stdenv.mkDerivation rec { 
#  name = "Atom"; 
#  version = "0.1";

#  patches = [ ./findYamlCpp.patch ./findROOT.patch ./noDoxygen.patch ./absolutePathInAtomenv.patch ]; # ./findHepMC.patch 

#  buildInputs = [ cmake root5 HepMC gsl FastJet pkgconfig libyamlcppPIC 
#                  python cython0192 boost YODA gtest
#                # graphviz
#                #  doxygen
#                ] ++ (if (!stdenv.isDarwin) then [stdenv.gcc.libc] else []);
#  pkgconfigDepends = [ libyamlcppPIC ] ;
#  enableParallelBuilding = true; 

  # Necessary to find libdl (for linux)
#  dlpath = if ( !stdenv.isDarwin ) then "${stdenv.gcc.libc}" else "";


#  preConfigure = '' 
#
#    substituteInPlace bin/atomenv.sh --subst-var prefix
#    substituteInPlace bin/atomenv.csh --subst-var prefix 
#    substituteInPlace CMakeModules/FindROOT.cmake --subst-var dlpath 
#''; 

#  cmakeFlags = if ( stdenv.isDarwin ) then
#    ''-DCMAKE_CXX_FLAGS=-fPIC  -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-undefined,dynamic_lookup"  -DCMAKE_VERBOSE_MAKEFILE=ON -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DBoost_NO_SYSTEM_PATHS=true  -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} -DUSE_BOOST_FILESYSTEM=OFF ''
#               else ''-DCMAKE_CXX_FLAGS=-fPIC  -DCMAKE_VERBOSE_MAKEFILE=ON -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DBoost_NO_SYSTEM_PATHS=true  -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} -DUSE_BOOST_FILESYSTEM=OFF '';
 
#  meta = { 
#    priority  = "9";
#  };

#}
