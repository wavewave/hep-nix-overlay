{ stdenv, cmake, root5, HepMC, gsl, FastJet, pkgconfig
, python, cython0192, libyamlcppPIC,  boost, YODA, gtest
}:
 
let patchedFiles = [ "CMakeLists.txt"
                     "CMakeModules/FindYamlCpp.cmake"
                     "CMakeModules/FindROOT.cmake"
                     "bin/atomenv.csh"
                     "bin/atomenv.sh"
                   ];
    toGitAssumeUnchangedCommand = s: "git update-index --assume-unchanged ${s}";
    doGitAssumeUnchanged = stdenv.lib.concatStringsSep ";" (map toGitAssumeUnchangedCommand patchedFiles);

    postPatchStr = doGitAssumeUnchanged;


in stdenv.mkDerivation rec { 
  name = "Atom-dev"; 
  src = ./.; 
  patches = [ ../../Atom/findYamlCpp.patch 
              ../../Atom/findROOT.patch 
              ../../Atom/noDoxygen.patch 
              ../../Atom/absolutePathInAtomenv.patch ];
  postPatch = postPatchStr;

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
