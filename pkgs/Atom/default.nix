{ stdenv, fetchurl, pkgs, cmake, root5, HepMC, gsl, FastJet, pkgconfig
, python, cython0192, libyamlcppPIC,  boost, YODA, gtest
}:
 
stdenv.mkDerivation rec { 
  name = "Atom-${version}"; 
  version = "0.9";

  src = fetchurl { 
    url = "http://ianwookim.org/public/atom/Atom-0.9.1-20150326.tar.gz";
    sha256 = "1i2iy4h5hwbpadrqh71l171dg7rp5zzhfpx9vn6np4mcrwdn0ji3";
  };
  patches = []; 

  buildInputs = [ cmake root5 HepMC gsl FastJet pkgconfig libyamlcppPIC 
                  pkgs.pythonFull cython0192 boost boost.dev boost.lib YODA gtest
                  pkgs.eigen
                ] ++ (if (!stdenv.isDarwin) then [stdenv.cc.libc] else []);
  pkgconfigDepends = [ libyamlcppPIC ] ;
  enableParallelBuilding = true; 
  doCheck = false;


  preConfigure = '' 
    substituteInPlace bin/atom --replace /usr/bin/env ${pkgs.coreutils}/bin/env
    substituteInPlace bin/atom-config.in --replace /usr/bin/env ${pkgs.coreutils}/bin/env
    substituteInPlace bin/aida2root --replace /usr/bin/env ${pkgs.coreutils}/bin/env
  ''; 

  cmakeFlags = if ( stdenv.isDarwin ) then
    ''-DCMAKE_CXX_FLAGS=-fPIC  -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-undefined,dynamic_lookup"  -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DBoost_NO_SYSTEM_PATHS=true  -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} -DUSE_BOOST_FILESYSTEM=OFF -DENABLE_TESTS=false -DBUILD_DOCUMENTATION=OFF'' 
               else ''-DCMAKE_CXX_FLAGS=-fPIC  -DYamlCpp_STATIC_LIBRARY=TRUE -DYamlCpp_DIR=${libyamlcppPIC} -DBoost_DIR=${boost} -DBoost_NO_SYSTEM_PATHS=true  -DHEPMC_DIR=${HepMC} -DHEPMC_ROOT_DIR=${HepMC} -DUSE_BOOST_FILESYSTEM=OFF -DENABLE_TESTS=false -DBUILD_DOCUMENTATION=OFF'';
 
  meta = { 
  };

}

