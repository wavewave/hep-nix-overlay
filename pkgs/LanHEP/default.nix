{ pkgs, fetchurl }:

with pkgs;

stdenv.mkDerivation rec {
  name = "LanHEP-${version}";
  version = "3.2.0";
  src = fetchurl {
    url = "http://theory.sinp.msu.ru/~semenov/lhep320.tgz";
    sha256 = "17bqgva75zi7wjkhw1lzakr5m89p60lrq7x78v7kbgni2yyqa2jb";
  };
  buildInputs = [ ];
  patches = [ ./compiler.patch ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    cd ..
    tar czf ${name}.tar.gz $sourceRoot/lhep $sourceRoot/SLHAplus $sourceRoot/manuals $sourceRoot/mdl $sourceRoot/minsusy $sourceRoot/susy8 $sourceRoot/susyLHA $sourceRoot/test
    mkdir -p $out/share/${name}
    cp ${name}.tar.gz $out/share/${name}
  '';

  meta = {
  };
}
