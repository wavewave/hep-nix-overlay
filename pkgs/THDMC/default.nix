{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  name = "THDMC-${version}";
  version = "1.6.5";
  src = fetchurl {
    url = "http://www.hepforge.org/archive/2hdmc/2HDMC-1.6.5.tar.gz";
    sha256 = "0364bywafrg7ac1b4kkffnyiaarrmbxa4fjncmmkdlslnkbkbcrx";
  };
  patches = [  ];
  buildInputs = [ gsl ];

  configurePhase = ''
    substituteInPlace Makefile --replace "CC = g++" "CC = c++"
    substituteInPlace Makefile --replace "LDFLAGS=-lgsl -lgslcblas" "LDFLAGS=-L${gsl}/lib -lgsl -lgslcblas"
    substituteInPlace Makefile --replace "CFLAGS= -Wall $(DEBUG) $(OPT)" "CFLAGS= -Wall $(DEBUG) $(OPT) -I${gsl}/include"
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -a CalcGen CalcH2 CalcHiggs CalcInert CalcLH CalcMSSM CalcPhys Demo $out/bin
  '';

  meta = {
  };
}
