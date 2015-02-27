{ pkgs, stdenv, fetchgit, root5, HepMC, FastJet, pkgconfig, cython0192, libyamlcppPIC, YODA
}:

let pythonAtom = pkgs.pythonFull.override { 
      # extraLibs = with pkgs.pythonPackages; [ numpy scipy ];
    };
    patches = [ ../../Atom/findYamlCpp.patch 
                ../../Atom/findROOT.patch 
                ../../Atom/noDoxygen.patch 
                # ../../absolutePathInAtomenv.patch 
              ]; 
    toPatchCommand = s: "echo \"applying patch ${s}\"; cat ${s}| patch -p1";
    doPatch = stdenv.lib.concatStringsSep ";" (map toPatchCommand patches) ;
    patchedFiles = [ "CMakeLists.txt"
                     "CMakeModules/FindYamlCpp.cmake"
                     "CMakeModules/FindROOT.cmake"
                     # "bin/atomenv.csh"
                     # "bin/atomenv.sh"
                   ];
    toGitAssumeUnchangedCommand = s: "git update-index --assume-unchanged ${s}";
    doGitAssumeUnchanged = stdenv.lib.concatStringsSep ";" (map toGitAssumeUnchangedCommand patchedFiles);

    postPatch = doGitAssumeUnchanged;
    cmakeFlags = with pkgs; if ( stdenv.isDarwin ) then
    ''-DCMAKE_CXX_FLAGS=-fPIC  -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-undefined,dynamic_lookup"  -DCMAKE_VERBOSE_MAKEFILE=ON -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DBoost_NO_SYSTEM_PATHS=true  -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} -DUSE_BOOST_FILESYSTEM=OFF ''
               else ''-DCMAKE_CXX_FLAGS=-fPIC  -DCMAKE_VERBOSE_MAKEFILE=ON -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DBoost_NO_SYSTEM_PATHS=true  -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} -DUSE_BOOST_FILESYSTEM=OFF '';
  

in pkgs.myEnvFun rec { 
  name = "atom-dev";

  buildInputs = with pkgs; [ 
    cmake root5 HepMC gsl FastJet pkgconfig libyamlcppPIC 
    python cython0192 boost YODA gtest stdenv pythonPackages.ipython
  ] ++ (if (!stdenv.isDarwin) then [stdenv.gcc.libc] else []);


  extraCmds = with pkgs; ''
    #export PYTHONPATH=
    #export NIX_STORE=$NIX_STORE
    #export LD_LIBRARY_PATH=${HepMC}/lib:${root5}/lib:${gsl}/lib:${FastJet}/lib:${libyamlcppPIC}/lib:${cython0192}/lib:${boost}/lib:${YODA}/lib:${gtest}/lib


    patchPhase () {
      ${doPatch};
      ${postPatch}; 
    }
    export -f patchPhase 
   
    export cmakeFlags="${cmakeFlags}"

  '';
}

# :${stdenv.gcc.libc}/lib