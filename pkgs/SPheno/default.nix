{ pkgs, stdenv, fetchurl }:

with pkgs;

stdenv.mkDerivation rec {
  name = "SPheno-${version}";
  version = "3.3.3";
  src = fetchurl {
    url = "http://www.hepforge.org/archive/spheno/SPheno-3.3.3.tar.gz";
    sha256 = "11x34hc0scm0sfm95a3i548ihh9dvd9pk0xzx9vxn5m0sa38aszl";
  };
  patches = [ ./use-gfortran.patch ];
  buildInputs = [ gfortran ];
  enableParallelBuilding = false;

  installPhase = ''
    mkdir -p $out
    cp -r bin doc lib include input output $out
  '';

  dontFixup = true;
}
