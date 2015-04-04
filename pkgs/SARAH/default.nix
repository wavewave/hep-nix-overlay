{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  name = "SARAH";
  version = "4.5.3";
  src = fetchurl {
    url = "http://www.hepforge.org/archive/sarah/SARAH-4.5.3.tar.gz";
    sha256 = "18v01ckpxqs1x21n90cys6l6v9956j6k1aqdv6dan92384yk9ynv";
  };

  installPhase = ''
    cd ..
    tar cvzf ${name}-${version}.tar.gz ${name}-${version}
    mkdir -p $out/share/${name}-${version}
    cp -a ${name}-${version}.tar.gz $out/share/${name}-${version}
  '';

  meta = {
  };
}
