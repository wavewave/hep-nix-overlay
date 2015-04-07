{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  name = "FeynHiggs-${version}";
  version = "2.10.3";
  src = fetchurl {
    url = "http://wwwth.mpp.mpg.de/members/heinemey/feynhiggs/newversion/FeynHiggs-2.10.3.tar.gz";
    sha256 = "0gj2hi5yzvjwawx10gmbmm5fhcjnqk3crqqax21hqwikllhkags9";
   };
  buildInputs = [ pkgs.gfortran pkgs.which ];
  enableParallelBuilding = true;

  preConfigure = ''
    substituteInPlace configure --replace /bin/sh ${pkgs.bash}/bin/bash
  '';

  configureFlags = "--64";

  meta = {
  };
}
