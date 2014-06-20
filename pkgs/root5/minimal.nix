{ stdenv, fetchurl, cmake, gfortran, zlib, libX11, libXext, libXpm, libXft
, libtiff, libjpeg, giflib, libpng, pcre, freetype
, gsl, pkgconfig
}:
 
stdenv.mkDerivation rec { 
  name = "root5-minimal-${version}";
  version = "34.18";
  src = fetchurl { 
    url = "ftp://root.cern.ch/root/root_v5.34.18.source.tar.gz";
    sha256 = "0rrm5bw4xyhffd7yhz0c9n67r6sdphqvv1frmfyfacbbszkxr5li";
  };
  enableParallelBuilding = true;
  buildInputs = [ cmake zlib libX11 libXext libXpm libXft freetype
                  gsl libtiff libjpeg giflib libpng pcre
                  pkgconfig  
                ];
  patches = [ ./no-sys-dirs.patch ]; 

  preConfigure = '' 
    NIX_ENFORCE_PURITY=0
    substituteInPlace cmake/modules/FindGSL.cmake --replace "/usr/bin/" "" --replace "/usr/bin" "" --replace "/usr/local/bin" "" 
'';
  cmakeFlags = if (stdenv.isDarwin) 
               then "-Dopengl:String=OFF -Dpythia8:String=OFF -Dpythia6:String=OFF -Dpgsql:String=OFF -Dgviz:String=OFF -Drpath:String=ON -Dkrb5=OFF -Dmysql=OFF -Dldap=OFF -Dx11=ON -Dfftw3=OFF -Dfitsio=OFF -Dssl=OFF -Dpython=OFF -Dxml=OFF -Doracle=OFF -Dsqlite=OFF -Dodbc=OFF -Ddcache=OFF -Dgfal=OFF -Dxrootd=OFF -Droofit=OFF -Dtmva=OFF -Dminuit2=OFF -Dreflex=ON -Dfortran=OFF  -Dmathmore=OFF -Dmonalisa=OFF -Dalien=OFF -DCMAKE_BUILD_TYPE=Debug" 

               else "-Dopengl:String=OFF -Dpythia8:String=OFF -Dpythia6:String=OFF -Dpgsql:String=OFF -Dgviz:String=OFF -Drpath:String=ON -Dkrb5=OFF -Dmysql=OFF -Dldap=OFF -Dx11=ON -Dfftw3=OFF -Dfitsio=OFF -Dssl=OFF -Dpython=OFF -Dxml=OFF -Doracle=OFF -Dsqlite=OFF -Dodbc=OFF -Ddcache=OFF -Dgfal=OFF -Dxrootd=OFF -Droofit=OFF -Dtmva=OFF -Dminuit2=OFF -Dreflex=ON -Dfortran=OFF  -Dmathmore=OFF -Dmonalisa=OFF -Dalien=OFF";   

  #preBuild = "NIX_ENFORCE_PURITY=0";
}


