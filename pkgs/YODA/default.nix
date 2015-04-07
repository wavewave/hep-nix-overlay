{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  name = "YODA-${version}";
  version = "1.3.1";

  src = fetchurl {
    url = "http://www.hepforge.org/archive/yoda/YODA-1.3.1.tar.bz2";
    sha256 = "0iwppj9m8bv6qd5kdhqyqais2g31x5nqgnzjs5nsqfly01nijki7";
  };

  buildInputs = [ boost python ];
  enableParallelBuilding = true;

  preConfigure = if stdenv.isDarwin then ''
    substituteInPlace pyext/setup.py.in --replace "stdc++" "c++"
  ''
    else ''
  '';

  configureFlags = "--with-boost=${boost.dev}";

  meta = {
  };
}
