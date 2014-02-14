{ stdenv, fetchurl}: # , libtool, gmp, mpfr }: # ,  cgal, boost }:
#, cgal 

stdenv.mkDerivation { 
  name = "FastJet"; 
  version = "3.0.6";
  src = fetchurl { 
    url = "http://fastjet.fr/repo/fastjet-3.0.6.tar.gz";
    sha256 = "02ysyfq8gw3bp74xjypszj3c886pa2h6fak1q0xl7r5g2k8g264p";
  };
  enableParallelBuilding = true; 
  #buildInputs = [ libtool gmp mpfr ]; # cgal boost ]; #cgal
  configureFlags = "--enable-allcxxplugins " ; #" --enable-cgal --with-cgaldir=${cgal} ";
}
