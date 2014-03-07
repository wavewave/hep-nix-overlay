{ pkgs, stdenv, fetchgit, root5, HepMC, FastJet, pkgconfig, cython0192, libyamlcppPIC, YODA
}:

# , cmake
# , gsl
# , python
# ,  boost
# , gtest
# , Rivet
# , graphviz
# , doxygen 
 


let pythonAtom = pkgs.pythonFull.override { 
      # extraLibs = with pkgs.pythonPackages; [ numpy scipy ];
    };
    sourcePatches = [ ./findYamlCpp.patch 
                      ./findROOT.patch 
                      ./noDoxygen.patch 
                      ./absolutePathInAtomenv.patch ]; 
    tet = stdenv.lib.concatStringsSep ":" sourcePatches;
in pkgs.myEnvFun rec { 
  name = "atom-dev";

  buildInputs = with pkgs; [
    # pythonAtom
    stdenv
  ];

  #    for i in ${sourcePatches}; do 
  #      echo "applying patch $i"
  #    done;
  

  extraCmds = with pkgs; ''
    export PYTHONPATH=
    export LD_LIBRARY_PATH=

    patchPhase () {
      echo ${tet}
    }
    export -f patchPhase 

    cmakeConfigurePhase () {
      echo "configure phase";
    }
    export -f cmakeConfigurePhase

    #buildPhase () {
    #  echo "build phase";
    #} 
    #export -f buildPhase
 
    #installPhase () {
    #  echo "install phase";
    #}
    #export -f installPhase
 
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
