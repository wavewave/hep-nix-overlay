{ pkgs, stdenv, fetchurl }:

with pkgs;

stdenv.mkDerivation rec {
  name = "SPheno-${version}";
  version = "3.3.5";
  src = fetchurl {
    url = "http://www.hepforge.org/archive/spheno/SPheno-3.3.5.tar.gz";
    sha256 = "0nisc67qlhc5cfrfbjill1bmsyn8maxdlkj3varxqfwzxn7bwcg0";
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
