{ stdenv, fetchurl, cmake, zlib, libX11, libXext, libXpm, libXft
, libtiff, libjpeg, giflib, libpng, pcre, freetype
, python, libxml2, gsl, openssl, pkgconfig, fftw, sqlite, cfitsio
, binutils
, bash
, subversion
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
                  pkgconfig fftw sqlite cfitsio subversion
                ] ++ (if stdenv.isDarwin then [ darwin.sw_vers ] else []);
  patches = [ ./force_darwin_64.patch
              ./add_libc_dir_for_dict.patch
              ./dont-build-tutorial.patch
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

  cmakeFlags = [ "-Dcastor=OFF -Dcocoa=OFF -Dfortran=OFF -Dgviz=OFF -Dkrb5=OFF -Dldap=OFF -Dminuit2=ON -Dmysql=OFF -Dopengl=OFF -Doracle=OFF -Dpgsql=OFF -Dpythia6=OFF -Dpythia8=OFF -Dpython=ON -Droofit=ON -Drpath=ON"
                  "-DCMAKE_VERBOSE_MAKEFILE=ON"
                ] ++ (if stdenv.isDarwin
                      then [ "-Dx11=ON"
                             "-DCMAKE_LIBC_DIR=${stdenv.cc.libc}"
                             "-DCMAKE_C_FLAGS='-I${stdenv.cc.libc}/include' -DCMAKE_CXX_FLAGS='-I${stdenv.cc.libc}/include'"
                             "-DCMAKE_OSX_DEPLOYMENT_TARGET="
                             "-DPYTHON_INCLUDE_DIR=${python}/include/python2.7"
                             "-DPYTHON_LIBRARY=${python}/lib/libpython2.7.dylib"
                           ]
                      else [ "-DCMAKE_BUILD_WITH_INSTALL_RPATH:BOOL=FALSE -DCMAKE_SKIP_BUILD_RPATH=TRUE" ]);
}
