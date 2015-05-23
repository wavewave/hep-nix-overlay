{ stdenv, fetchurl, cmake, zlib, libX11, libXext, libXpm, libXft
, libtiff, libjpeg, giflib, libpng, pcre, freetype
, python, libxml2, gsl, openssl, pkgconfig, fftw, sqlite, cfitsio
, darwin ? null
}:

stdenv.mkDerivation rec {
  name = "root5-${version}";
  version = "34.30";
  src = fetchurl {
    url = "http://root.cern.ch/download/root_v5.34.30.source.tar.gz";
    sha256 = "1iahmri0vi1a44qkp2p0myrjb6izal97kf27ljfvpq0vb6c6vhw4";
  };
  enableParallelBuilding = true;
  buildInputs = [ cmake zlib libX11 libXext libXpm libXft pcre freetype
                  giflib libtiff libjpeg libpng
                  python gsl libxml2 openssl
                  pkgconfig fftw sqlite cfitsio
                ] ++ (if stdenv.isDarwin then [ darwin.sw_vers ] else []);
  patches = if stdenv.isDarwin then [./force_darwin_64.patch] else [];

  preConfigure = ''
      substituteInPlace cmake/modules/FindGSL.cmake --replace "/usr/bin/" "" --replace "/usr/bin" "" --replace "/usr/local/bin" ""
  '';

  cmakeFlags = [ "-Dcastor=OFF -Dfortran=OFF -Dgviz=OFF -Dkrb5=OFF -Dldap=OFF -Dminuit2=ON -Dmysql=OFF -Dopengl=OFF -Doracle=OFF -Dpgsql=OFF -Dpythia6=OFF -Dpythia8=OFF -Dpython=ON -Droofit=ON"
                 "-Dcxx11=OFF -Dlibcxx=OFF"
                 "-Drpath=OFF"
               ] ++ (if stdenv.isDarwin
                     then [ "-DCMAKE_OSX_DEPLOYMENT_TARGET="
                            "-DPYTHON_INCLUDE_DIR=${python}/include/python2.7"
                            "-DPYTHON_LIBRARY=${python}/lib/libpython2.7.dylib"
                          ]
                     else []);
}
