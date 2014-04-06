{ stdenv, fetchurl, cmake, gfortran, zlib, libX11, libXext, libXpm, libXft
, libtiff, libjpeg, giflib, libpng, pcre, freetype
, python, libxml2, gsl, krb5, openssl, pkgconfig, fftw, sqlite, cfitsio
}:
 
stdenv.mkDerivation rec { 
  name = "root5-${version}";
  version = "34.18";
  src = fetchurl { 
    url = "ftp://root.cern.ch/root/root_v5.34.18.source.tar.gz";
    sha256 = "0rrm5bw4xyhffd7yhz0c9n67r6sdphqvv1frmfyfacbbszkxr5li";
  };
  enableParallelBuilding = true;
  buildInputs = [ cmake gfortran zlib libX11 libXext libXpm libXft pcre freetype 
                  giflib libtiff libjpeg libpng 
                  python 
                  gsl krb5 libxml2 openssl
                  pkgconfig fftw sqlite cfitsio
                ];
  patches = [ ./no-sys-dirs.patch ]; 
  preConfigure = '' 
    #export pythonnix=${python}
    substituteInPlace cmake/modules/FindGSL.cmake --replace "/usr/bin/" "" --replace "/usr/bin" "" --replace "/usr/local/bin" "" 
    #substituteInPlace cmake/modules/SearchInstalledSoftware.cmake --subst-var pythonnix
'';
  cmakeFlags = if (stdenv.isDarwin) 
               then "-Dopengl:String=OFF -Dpythia8:String=OFF -Dpythia6:String=OFF -Dpgsql:String=OFF -Dpython:String=ON -Dgviz:String=OFF -Droofit:BOOL=ON -Dminuit2:BOOL=ON -Drpath:String=ON -DPYTHON_INCLUDE_DIR=${python}/include/python2.7 -DPYTHON_LIBRARY=${python}/lib/libpython2.7.dylib " 

               else "-Dopengl:String=OFF -Dpythia8:String=OFF -Dpythia6:String=OFF -Dpgsql:String=OFF -Dpython:String=ON -Dgviz:String=OFF -Droofit:BOOL=ON -Dminuit2:BOOL=ON -Drpath:String=ON ";   

}


