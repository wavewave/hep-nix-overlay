{ stdenv, fetchurl, pkgs }:

stdenv.mkDerivation rec {
  name = "FeynHiggs-${version}";
  version = "2.10.2";
  src = fetchurl {
    url = "http://wwwth.mpp.mpg.de/members/heinemey/feynhiggs/newversion/FeynHiggs-2.10.2.tar.gz";
    sha256 = "1977jnxp9a43kf5qndcxap05wpi028v6bx27xx5qhbqv0di23mjq";
   };
  buildInputs = [ pkgs.gfortran pkgs.which ];
  enableParallelBuilding = true;

  preConfigure = ''
    substituteInPlace configure --replace /bin/sh ${pkgs.bash}/bin/bash
  '';

  configureFlags = if stdenv.isDarwin then "--64" else "";

  meta = {
  };
}
