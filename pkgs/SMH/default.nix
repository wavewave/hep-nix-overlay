{ pkgs, fetchurl, TSIL }:

with pkgs;

stdenv.mkDerivation rec {
  name = "SMH-${version}";
  version = "1.0";
  src = fetchurl {
    url = "http://www.niu.edu/spmartin/smh/smh-1.0.tar.gz";
    sha256 = "06nwgbpz0wc9sq14m0im9v31l1qpw7a9hc09y6lrnjfci27prypx";
  };
  buildInputs = [ TSIL ];
  patches = [ ./compiler.patch ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -a smh.tst calc_Mh calc_lambda calc_vev calc_m2 rgrun fig_vev_vs_Q fig_m2_vs_Q fig_Mh_vs_Q fig_lambda_vs_Q $out/bin
    mkdir -p $out/include
    cp -a smhiggs.h $out/include
    mkdir -p $out/lib
    cp -a libsmh.a $out/lib
  '';

  meta = {
  };
}
