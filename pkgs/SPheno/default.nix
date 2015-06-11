{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  name = "SPheno-${version}";
  version = "3.3.7";
  src = fetchurl {
    url = "http://www.hepforge.org/archive/spheno/SPheno-3.3.7.tar.gz";
    sha256 = "0s7rrr09spvfcs6j6mfvivgf9in50v8pj1ydbfvs8j257an8zpiv";
  };
  patches = [ ];
  buildInputs = [ gfortran ];
  enableParallelBuilding = false;

  configurePhase = ''
    substituteInPlace Makefile --replace "# F90 = gfortran" "F90 = gfortran"
    substituteInPlace Makefile --replace "F90 = ifort" "# F90 = ifort"
  '';

  installPhase = ''
    mkdir -p $out
    cp -a bin doc lib include input output $out
  '';

  dontFixup = true;
}
