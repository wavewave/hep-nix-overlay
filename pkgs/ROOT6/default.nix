{ stdenv, fetchurl, cmake, zlib, libX11, libXext, libXpm, libXft
, libtiff, libjpeg, giflib, libpng, pcre, freetype
, python, libxml2, gsl, openssl, pkgconfig, fftw, sqlite, cfitsio
, binutils
, bash
, darwin ? null
}:

assert stdenv.isDarwin -> darwin != null; 

stdenv.mkDerivation rec { 
  name = "ROOT6-${version}";
  version = "02.04";
  src = fetchurl { 
    url = "http://root.cern.ch/download/root_v6.02.04.source.tar.gz";
    sha256 = "1rkrhx850d6fpzl57p9hszbvcn6d6j0ahr2bvcggx52rm1wx177x";
  };
  enableParallelBuilding = true;
  buildInputs = [ cmake zlib libX11 libXext libXpm libXft pcre freetype 
                  giflib libtiff libjpeg libpng 
                  python 
                  gsl libxml2 openssl
                  pkgconfig fftw sqlite cfitsio
                ] ++ (if stdenv.isDarwin then [ darwin.sw_vers ] else []);
  patches = [ ./force_darwin_64.patch 
              ./add_libc_dir_for_dict.patch
            ] ++ (if stdenv.isDarwin then [ ./force_llvm_host_arch_osx.patch ] else []);

  preConfigure = if (stdenv.isDarwin) then 
   '' 
      #NIX_ENFORCE_PURITY=0
      export CMAKE_INCLUDE_PATH=${stdenv.cc.libc}/include
      export NIX_CFLAGS_COMPILE="-target x86_64-apple-darwin11.4.2 $NIX_CFLAGS_COMPILE"
      export NIX_CFLAGS_LINK="-target x86_64-apple-darwin11.4.2 $NIX_CFLAGS_LINK"
      substituteInPlace cmake/modules/FindGSL.cmake --replace "/usr/bin/" "" --replace "/usr/bin" "" --replace "/usr/local/bin" "" 
      substituteInPlace build/unix/compiledata.sh --replace "/usr/bin/env bash" "${bash}/bin/bash" 
      substituteInPlace build/unix/gitinfo.sh --replace "/usr/bin/env bash" "${bash}/bin/bash" 
      substituteInPlace build/unix/githeader.sh --replace "/usr/bin/env bash" "${bash}/bin/bash" 
      substituteInPlace build/unix/gitinfollvm.sh --replace "/usr/bin/env bash" "${bash}/bin/bash" 
   '' 
   else "";


   cmakeFlags = if (stdenv.isDarwin)
                then "-DCMAKE_LIBC_DIR=${stdenv.cc.libc} -DCMAKE_VERBOSE_MAKEFILE=ON  -DCMAKE_C_FLAGS='-I${stdenv.cc.libc}/include' -DCMAKE_CXX_FLAGS='-I${stdenv.cc.libc}/include'  -DCMAKE_OSX_DEPLOYMENT_TARGET= -Dopengl:String=OFF -Dpythia8:String=OFF -Dpythia6:String=OFF -Dpgsql:String=OFF -Dpython:String=ON -Dgviz:String=OFF -Droofit:BOOL=ON -Dminuit2:BOOL=ON -Dldap=OFF -Dcocoa:String=OFF -Dx11=ON -Drpath:String=ON  "
                else "-DCMAKE_VERBOSE_MAKEFILE=ON -Dopengl:String=OFF -Dpythia8:String=OFF -Dpythia6:String=OFF -Dpgsql:String=OFF -Dpython:String=ON -Dgviz:String=OFF -Droofit:BOOL=ON -Dminuit2:BOOL=ON -Dldap=OFF -Dkrb5:BOOL=OFF -Dmysql:BOOL=OFF"; 

}

# -Drpath:BOOL=ON -DCMAKE_SKIP_BUILD_RPATH:BOOL=OFF -DCMAKE_BUILD_WITH_INSTALL_RPATH:BOOL=FALSE  ";   

