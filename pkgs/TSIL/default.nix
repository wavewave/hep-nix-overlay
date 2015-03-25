{ pkgs, fetchurl }:

with pkgs;

stdenv.mkDerivation rec {
  name = "TSIL-${version}";
  version = "1.21";
  src = fetchurl {
    url = "http://www.niu.edu/spmartin/TSIL/tsil-1.21.tar.gz";
    sha256 = "0pr6gvfs3wv53h682wzjs1zl8h5gmydqa5v7h7ii79byas43lfyj";
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
