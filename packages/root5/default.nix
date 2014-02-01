{ stdenv, fetchurl, cmake, gfortran, zlib, libX11, libXext, libXpm, libXft
, libtiff, libjpeg, giflib, libpng, pcre, freetype
# , python # for the time being
, libxml2
, gsl, krb5, openssl, pkgconfig, fftw, sqlite, cfitsio
}:
 
stdenv.mkDerivation { 
  name = "root5-34.12"; 
  src = fetchurl { 
    url = "ftp://root.cern.ch/root/root_v5.34.12.source.tar.gz";
    sha256 = "b471def39ef2ce032a820e46b4c7a699ca0a7f123f4d975a7bf151b49831e802";
  };
  enableParallelBuilding = true;
  buildInputs = [ cmake gfortran zlib libX11 libXext libXpm libXft pcre freetype 
                  giflib libtiff libjpeg libpng 
                  # python 
                  gsl krb5 libxml2 openssl
                  pkgconfig fftw sqlite cfitsio
                ];
  patches = [ ./no-sys-dirs.patch ];
  preConfigure = '' 
    substituteInPlace cmake/modules/FindGSL.cmake --replace "/usr/bin/" "" --replace "/usr/bin" "" --replace "/usr/local/bin" "" 
'';
  cmakeFlags = "-Dopengl:String=OFF -Dpythia8:String=OFF -Dpythia6:String=OFF -Dpgsql:String=OFF -Dpython:String=OFF -Dgviz:String=OFF -Drpath:String=ON";   

}


