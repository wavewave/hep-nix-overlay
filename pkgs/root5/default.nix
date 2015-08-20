{ stdenv, fetchurl, cmake, zlib, libX11, libXext, libXpm, libXft
, libtiff, libjpeg, giflib, libpng, pcre, freetype
, python, libxml2, gsl, openssl, pkgconfig, fftw, sqlite, cfitsio
, bash
, darwin ? null
}:

stdenv.mkDerivation rec {
  name = "root5-${version}";
  version = "34.32";
  src = fetchurl {
    url = "http://root.cern.ch/download/root_v5.34.32.source.tar.gz";
    sha256 = "0pzwh22a1al6yhh6nvdg5glm5gwr2vjvdvwkqp5vcm1ah297b74k";
  };
  enableParallelBuilding = true;
  buildInputs = [ cmake zlib libX11 libXext libXpm libXft pcre freetype
                  giflib libtiff libjpeg libpng
                  python gsl libxml2 openssl
                  pkgconfig fftw sqlite cfitsio ];
  patches = if stdenv.isDarwin
            then [ ./force_darwin_64.patch
                   ./not_use_sw_vers.patch ]
            else [];

  preConfigure = ''
      substituteInPlace cmake/modules/FindGSL.cmake --replace "/usr/bin/" "" --replace "/usr/bin" "" --replace "/usr/local/bin" ""
      substituteInPlace build/unix/compiledata.sh --replace "/usr/bin/env bash" "${bash}/bin/bash"
  '';

  cmakeFlags = [ "-Dalien=OFF -Dcastor=OFF -Dchirp=OFF -Dclarens=OFF -Dcocoa=OFF -Ddcache=OFF -Dfortran=OFF -Dgfal=OFF -Dglite=OFF -Dgviz=OFF -Dhdfs=OFF -Dkrb5=OFF -Dldap=OFF -Dminuit2=ON -Dmonalisa=OFF -Dmysql=OFF -Dodbc=OFF -Dopengl=OFF -Doracle=OFF -Dpch=OFF -Dpeac=OFF -Dpgsql=OFF -Dpythia6=OFF -Dpythia8=OFF -Dpython=ON -Droofit=ON -Dsapdb=OFF -Dsrp=OFF -Dxrootd=OFF"
                 "-Dcxx11=OFF -Dlibcxx=OFF"
                 "-Drpath=ON"
               ] ++ (if stdenv.isDarwin
                     then [ "-DCMAKE_OSX_DEPLOYMENT_TARGET="
                            "-DPYTHON_INCLUDE_DIR=${python}/include/python2.7"
                            "-DPYTHON_LIBRARY=${python}/lib/libpython2.7.dylib"
                          ]
                     else []);
}
