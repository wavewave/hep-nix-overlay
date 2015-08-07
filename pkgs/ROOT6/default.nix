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
  version = "04.00";
  src = fetchurl {
    url = "http://root.cern.ch/download/root_v6.04.00.source.tar.gz";
    sha256 = "1smyxslnh5lic8bw8f9xzwx59zpwkknjd2f76khz9xgj0rbixyn5";
  };
  enableParallelBuilding = true;
  buildInputs = [ cmake zlib libX11 libXext libXpm libXft pcre freetype
                  giflib libtiff libjpeg libpng
                  python
                  gsl libxml2 openssl
                  pkgconfig fftw sqlite cfitsio subversion ];
  patches = [ ./dont-build-tutorial.patch ] ++ (if stdenv.isDarwin
                                                then [ ./not_use_sw_vers.patch
                                                       ./force_darwin_64.patch
                                                       ./force_llvm_host_arch_osx.patch ]
                                                else []);

  preConfigure = if stdenv.isDarwin then ''
      substituteInPlace cmake/modules/FindGSL.cmake --replace "/usr/bin/" "" --replace "/usr/bin" "" --replace "/usr/local/bin" ""
      substituteInPlace build/unix/compiledata.sh --replace "/usr/bin/env bash" "${bash}/bin/bash"
      substituteInPlace build/unix/gitinfo.sh --replace "/usr/bin/env bash" "${bash}/bin/bash"
      substituteInPlace build/unix/githeader.sh --replace "/usr/bin/env bash" "${bash}/bin/bash"
      substituteInPlace build/unix/gitinfollvm.sh --replace "/usr/bin/env bash" "${bash}/bin/bash"
   ''
   else "";

  cmakeFlags = [ "-Dalien=OFF -Dcastor=OFF -Dcocoa=OFF -Dfortran=OFF -Dgfal=OFF -Dglite=OFF -Dgviz=OFF -Dkrb5=OFF -Dldap=OFF -Dminuit2=ON -Dmonalisa=OFF -Dmysql=OFF -Dopengl=OFF -Dodbc=OFF -Doracle=OFF -Dpgsql=OFF -Dpythia6=OFF -Dpythia8=OFF -Dpython=ON -Droofit=ON -Drpath=ON -Dsapdb=OFF -Dshadowpw=OFF -Dsrp=OFF -Dxrootd=OFF"
                  "-DCMAKE_VERBOSE_MAKEFILE=OFF"
                ] ++ (if stdenv.isDarwin
                      then [ "-Dx11=ON"
                             "-DCMAKE_OSX_DEPLOYMENT_TARGET="
                             "-DPYTHON_INCLUDE_DIR=${python}/include/python2.7"
                             "-DPYTHON_LIBRARY=${python}/lib/libpython2.7.dylib"
                           ]
                      else [ "-DCMAKE_BUILD_WITH_INSTALL_RPATH:BOOL=FALSE -DCMAKE_SKIP_BUILD_RPATH=TRUE" ]);
}
