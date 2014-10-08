{ pkgs, fetchurl }:

with pkgs;

stdenv.mkDerivation rec {
  name = "LanHEP-${version}";
  version = "3.1.9";
  src = fetchurl {
    url = "http://theory.sinp.msu.ru/~semenov/lhep319.tgz";
    sha256 = "0k2finn3slgacb6jb51n92gs0xj1acqhy2bkpg14aaszhwhcnaqw";
  };
  buildInputs = [ ];

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
