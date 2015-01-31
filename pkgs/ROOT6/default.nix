{ stdenv, fetchurl, cmake, zlib, libX11, libXext, libXpm, libXft
, libtiff, libjpeg, giflib, libpng, pcre, freetype
, python, libxml2, gsl, openssl, pkgconfig, fftw, sqlite, cfitsio
, binutils
# , gfortran 
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
                  # gfortran
                ];
  patches = [ ./force_darwin_64.patch ];

  preConfigure = if (stdenv.isDarwin) then 
   '' 
      NIX_ENFORCE_PURITY=0
      #sed s#sw_vers#${binutils}/bin/sw_vers#g -i bak configure 
      #sed s#sw_vers#${binutils}/bin/sw_vers#g -i bak config/Makefile.macosx
      #sed s#sw_vers#${binutils}/bin/sw_vers#g -i bak config/Makefile.macosx64
      #sed s#sw_vers#${binutils}/bin/sw_vers#g -i bak config/Makefile.macosxicc
      #sed s#sw_vers#${binutils}/bin/sw_vers#g -i bak config/root-config.in

      substituteInPlace cmake/modules/SetUpMacOS.cmake --replace "sw_vers" "${binutils}/bin/sw_vers"

      substituteInPlace cmake/modules/FindGSL.cmake --replace "/usr/bin/" "" --replace "/usr/bin" "" --replace "/usr/local/bin" "" 
      substituteInPlace build/unix/compiledata.sh --replace "sw_vers" "${binutils}/bin/sw_vers"
      substituteInPlace build/unix/makecintdll.sh --replace "sw_vers" "${binutils}/bin/sw_vers"
      substituteInPlace build/unix/makedist.sh    --replace "sw_vers" "${binutils}/bin/sw_vers"
      substituteInPlace build/unix/makelib.sh     --replace "sw_vers" "${binutils}/bin/sw_vers"     
   '' 
   else "";


   cmakeFlags = "-DCMAKE_SW_VERS:String='${binutils}/bin/sw_vers' -Dopengl:String=OFF -Dpythia8:String=OFF -Dpythia6:String=OFF -Dpgsql:String=OFF -Dpython:String=ON -Dgviz:String=OFF -Droofit:BOOL=ON -Dminuit2:BOOL=ON -Dldap=OFF -Drpath:String=ON ";   

}


