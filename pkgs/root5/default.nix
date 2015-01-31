{ stdenv, fetchurl, cmake, zlib, libX11, libXext, libXpm, libXft
, libtiff, libjpeg, giflib, libpng, pcre, freetype
, python, libxml2, gsl, kerberos, openssl, pkgconfig, fftw, sqlite, cfitsio
, binutils
}:
 
# , gfortran,

stdenv.mkDerivation rec { 
  name = "root5-${version}";
  version = "34.25";
  src = fetchurl { 
    url = "ftp://root.cern.ch/root/root_v5.34.25.source.tar.gz";
    sha256 = "0m1z5jrng52ky2w3x3m5gzlhhkc15hps91bxzgmrvpw4fqq9nj0w";
  };
  enableParallelBuilding = true;
  buildInputs = [ cmake zlib libX11 libXext libXpm libXft pcre freetype 
                  giflib libtiff libjpeg libpng 
                  python 
                  gsl kerberos libxml2 openssl
                  pkgconfig fftw sqlite cfitsio
                  # binutils
                ];
  # gfortran 
  patches = [ ./no_build_with_install_rpath.patch
              ./configure64.patch
              ./macosx_over_10_5.patch ];

  preConfigure = if (stdenv.isDarwin) then 
   '' 
      NIX_ENFORCE_PURITY=0
      #sed s#sw_vers#${binutils}/bin/sw_vers#g -i bak configure 
      #sed s#sw_vers#${binutils}/bin/sw_vers#g -i bak config/Makefile.macosx
      #sed s#sw_vers#${binutils}/bin/sw_vers#g -i bak config/Makefile.macosx64
      #sed s#sw_vers#${binutils}/bin/sw_vers#g -i bak config/Makefile.macosxicc
      #sed s#sw_vers#${binutils}/bin/sw_vers#g -i bak config/root-config.in


      substituteInPlace cmake/modules/FindGSL.cmake --replace "/usr/bin/" "" --replace "/usr/bin" "" --replace "/usr/local/bin" "" 
      substituteInPlace build/unix/compiledata.sh --replace "sw_vers" "${binutils}/bin/sw_vers"
      substituteInPlace build/unix/makecintdll.sh --replace "sw_vers" "${binutils}/bin/sw_vers"
      substituteInPlace build/unix/makedist.sh    --replace "sw_vers" "${binutils}/bin/sw_vers"
      substituteInPlace build/unix/makelib.sh     --replace "sw_vers" "${binutils}/bin/sw_vers"     
   ''
                 else
   '' 
      substituteInPlace cmake/modules/FindGSL.cmake --replace "/usr/bin/" "" --replace "/usr/bin" "" --replace "/usr/local/bin" "" 
   '';

  cmakeFlags = if (stdenv.isDarwin) 
               then "-DCMAKE_SW_VERS:String='${binutils}/bin/sw_vers' -Dopengl:String=OFF -Dpythia8:String=OFF -Dpythia6:String=OFF -Dpgsql:String=OFF -Dpython:String=ON -Dgviz:String=OFF -Droofit:BOOL=ON -Dminuit2:BOOL=ON -Dldap=OFF -Dkrb5:BOOL=OFF -Drpath:BOOL=OFF  -Dcxx11=OFF -Dlibcxx=OFF"


               else "-Dopengl:String=OFF -Dpythia8:String=OFF -Dpythia6:String=OFF -Dpgsql:String=OFF -Dpython:String=ON -Dgviz:String=OFF -Droofit:BOOL=ON -Dminuit2:BOOL=ON -Dldap=OFF -Dkrb5:BOOL=OFF -Drpath:BOOL=ON -DCMAKE_BUILD_WITH_INSTALL_RPATH:BOOL=FALSE";   

  
}

# -Dbuiltin_cfitsio=ON -Dbuiltin_davix=ON -Dbuiltin_freetype=ON -Dbuiltin_ftgl=ON -Dbuiltin_glew=ON -Dbuiltin_gsl=ON -Dbuiltin_lzma=ON -Dbuiltin_pcre=ON

#-Dlibcxx:BOOL=FALSE -Dopengl:String=OFF -Dpythia8:String=OFF -Dpythia6:String=OFF -Dpgsql:String=OFF -Dpython:String=ON -Dgviz:String=OFF -Droofit:BOOL=ON -Dminuit2:BOOL=ON -Dldap=OFF -Dkrb5:BOOL=OFF -Drpath:BOOL=OFF  -DPYTHON_INCLUDE_DIR=${python}/include/python2.7 -DPYTHON_LIBRARY=${python}/lib/libpython2.7.dylib 

