{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  name = "TSIL-${version}";
  version = "1.3";
  src = fetchurl {
    url = "http://www.niu.edu/spmartin/TSIL/tsil-1.3.tar.gz";
    sha256 = "11202f8f7cabg3p6pb3ws0iai222l73w5wgbswk99f08md6fzwb8";
  };
  buildInputs = [ ];
  patches = [ ./compiler.patch ];

  buildPhase = ''
    make
  '';

  installPhase = ''
    mkdir -p $out/lib
    mkdir -p $out/include
    cp -a libtsil.a $out/lib
    cp -a tsil.h $out/include
  '';

  meta = {
  };
}
