{ stdenv, fetchurl, pkgs}: 

stdenv.mkDerivation rec { 
  name = "SPheno-${version}"; 
  version = "3.3.2";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/spheno/SPheno-3.3.2.tar.gz";
    sha256 = "11cffr8lwcwaf62mg5c5asg7sn6jdra9dxapw2fj48fc3kx1fxwd";
  };
  patches = [ ./use-gfortran.patch ];
  buildInputs = [ pkgs.gfortran ];
  enableParallelBuilding = true; 
  
  installPhase = ''
  ensureDir $out
  cp -r bin doc lib include input output $out
  '';
  
  dontFixup = true;

  #configureFlags = "--enable-allcxxplugins " ; 
}