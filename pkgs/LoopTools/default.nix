{ pkgs }:

with pkgs;

stdenv.mkDerivation rec {
  name = "LoopTools-${version}";
  version = "2.12";
  src = fetchurl {
    url = "http://www.feynarts.de/looptools/LoopTools-2.12.tar.gz";
    sha256 = "1ms499sgx4jwmhq9531n2mbima2pjfdk9ak82kxglbrvlz56qnw7";
  };
  buildInputs = [ gfortran which ];
  enableParallelBuilding = true;

  configureFlags = "--64";

  meta = {
  };
}
