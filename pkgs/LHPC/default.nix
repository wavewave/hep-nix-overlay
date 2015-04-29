{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  name = "LHPC-${version}";
  version = "0.8.9";
  src = fetchurl {
    url = "http://www.hepforge.org/archive/lhpc/LHPC-0.8.9.tar.gz";
    sha256 = "1pp1lw7pyp8l81wskpafmhqdil6yx86sjl10awr5wrw9c9sgjcz3";
  };
  patches = [  ];
  buildInputs = [ ];
  enableParallelBuilding = true;

  configurePhase = ''
    substituteInPlace Makefile --replace "SHELL=/bin/sh" "SHELL=${bash}/bin/bash"
    substituteInPlace Makefile --replace "CC=g++" "CC=c++"
    substituteInPlace Makefile --replace "AR=ar" "AR=${binutils}/bin/ar"
    substituteInPlace include/BOLlib/Makefile --replace "SHELL=/bin/sh" "SHELL=${bash}/bin/bash"
    substituteInPlace include/BOLlib/Makefile --replace "CC=g++" "CC=c++"
    substituteInPlace include/BOLlib/Makefile --replace "AR=ar" "AR=${binutils}/bin/ar"
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -a bin/LhcoParserExample.exe bin/LhefParserExample.exe bin/LhpcSlhaValuePlotter.exe bin/LhpcSpectrumPlotter.exe bin/SlhaParserExample.exe $out/bin
    mkdir -p $out/include
    cp -a include/* $out/include
    mkdir -p $out/lib
    cp -a lib/* $out/lib
  '';

  meta = {
  };
}
