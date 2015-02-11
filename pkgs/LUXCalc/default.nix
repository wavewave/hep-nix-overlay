{ pkgs, fetchurl }:

with pkgs;

stdenv.mkDerivation rec {
  name = "LUXCalc-${version}";
  version = "1.1.0";
  src = fetchurl {
    url = "http://www.nordita.org/~savage/LUXCalc/LUXCalc-1.0.0.tar.gz";
    sha256 = "1fr971mc93vwhs6j5a5vy053wbjbsyv0hvrp4swrkdxzq323mdx2";
  };
  buildInputs = [ pkgs.gfortran ];
  patches = [ ./compiler.patch ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    cd ..
    tar czf ${name}.tar.gz $sourceRoot
    mkdir -p $out/share/${name}
    cp ${name}.tar.gz $out/share/${name}
  '';

  meta = {
  };
}
