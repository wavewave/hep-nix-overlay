{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  name = "SPheno-${version}";
  version = "3.3.6";
  src = fetchurl {
    url = "http://www.hepforge.org/archive/spheno/SPheno-3.3.6.tar.gz";
    sha256 = "17vs51h0ndzlr2j8kksaali5ggslq9n5bp61bwa5sd4mrssn3vj7";
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
