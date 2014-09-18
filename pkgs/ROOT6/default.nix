{ stdenv, fetchurl, cmake, zlib, libX11, libXext, libXpm, libXft
, libtiff, libjpeg, giflib, libpng, pcre, freetype
, python, libxml2, gsl, openssl, pkgconfig, fftw, sqlite, cfitsio
, gfortran 
}:
 

stdenv.mkDerivation rec { 
  name = "ROOT6-${version}";
  version = "00.02";
  src = fetchurl { 
    url = "ftp://root.cern.ch/root/root_v6.00.02.source.tar.gz";
    sha256 = "0vx00q00rgfbhvwkv57jypdwwl9bw2diygsqicxw6hpqh63q34nv";
  };
  enableParallelBuilding = true;
  buildInputs = [ cmake zlib libX11 libXext libXpm libXft pcre freetype 
                  giflib libtiff libjpeg libpng 
                  python 
                  gsl libxml2 openssl
                  pkgconfig fftw sqlite cfitsio
                  gfortran
                ];


  cmakeFlags = "-Dopengl:String=OFF -Dpythia8:String=OFF -Dpythia6:String=OFF -Dpgsql:String=OFF -Dpython:String=ON -Dgviz:String=OFF -Droofit:BOOL=ON -Dminuit2:BOOL=ON -Dldap=OFF -Drpath:String=ON ";   

}


