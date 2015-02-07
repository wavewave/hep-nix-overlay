{ stdenv, fetchurl, boost, python }:

stdenv.mkDerivation rec {
  name = "YODA-${version}";
  version = "1.3.0";

  src = fetchurl {
    url = "http://www.hepforge.org/archive/yoda/YODA-1.3.0.tar.bz2";
    sha256 = "05fj5cqq06qdb2pcqqdd5krqi4xlq3ch6iyg0v5iwj0bjkarfcfn";
  };

  buildInputs = [ boost python ];
  enableParallelBuilding = true;

  configureFlags = "--with-boost=${boost.dev}";

  meta = {
  };
}
