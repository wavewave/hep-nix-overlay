{ stdenv, cmake, git
, root5, HepMC, gsl, FastJet, pkgconfig
, python, cython0192, libyamlcppPIC,  boost, YODA, gtest, pkgs
}:
 
let pythonWithCython = pkgs.pythonFull.override { 
                         extraLibs = [ cython0192 ]; 
                       }; 
    
in stdenv.mkDerivation rec { 
  name = "Atom-dev"; 
  patches = [];

  buildInputs = [ git cmake root5 HepMC gsl FastJet pkgconfig libyamlcppPIC 
                  boost YODA gtest  
                  pythonWithCython pkgs.eigen
                ] ++ (if (!stdenv.isDarwin) then [stdenv.gcc.libc] else []);

  pkgconfigDepends = [ libyamlcppPIC ] ;
  enableParallelBuilding = true; 
  doCheck = true;

  #builder = ./builder.sh; 

  preConfigure = '' 
    # substituteInPlace bin/atomenv.sh --subst-var prefix
    # substituteInPlace bin/atomenv.csh --subst-var prefix 
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

