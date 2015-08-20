{ pkgs, fetchurl, root5 }:

with pkgs;

stdenv.mkDerivation rec {
  name = "ExRootAnalysis-${version}";
  version = "1.1.2";
  src = fetchurl {
    url = "http://madgraph.hep.uiuc.edu/Downloads/ExRootAnalysis/ExRootAnalysis_V1.1.2.tar.gz";
    sha256 = "0qz7bl355dsnsd5jyxfi46hv2yspflv4wry5qdiprvm7m16l3b6k";
  };
  buildInputs = [ which root5 ];
  patches = [ ];
  enableParallelBuilding = true;

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -a ExRootHEPEVTConverter ExRootLHCOlympicsConverter ExRootLHEFConverter ExRootSTDHEPConverter $out/bin
    mkdir -p $out/include
    cp -a ExRootAnalysis $out/include
    mkdir -p $out/lib
    cp -a libExRootAnalysis.so $out/lib
  '';

  meta = {
  };
}
