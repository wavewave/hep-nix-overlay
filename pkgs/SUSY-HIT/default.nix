{ pkgs, stdenv, fetchurl }:

with pkgs;

stdenv.mkDerivation rec {
  name = "SUSY-HIT-${version}";
  version = "1.4";
  src = fetchurl {
    url = "http://www.itp.kit.edu/~maggie/SUSY-HIT/susyhit.tar.gz";
    sha256 = "0y4vdrzv9kwikyhs1zm6csp57l5i9dkcp8hrbmqaxcs1r13wcf04";
  };
  buildInputs = [ gfortran ];

  unpackPhase = ''
    mkdir -p susyhit
    tar zxf $src -C susyhit
  '';

  buildPhase = ''
    cd susyhit
    make
  '';

  installPhase = ''
    cd ..
    tar czf susyhit-${version}.tar.gz susyhit/run susyhit/*.in
    mkdir -p $out/share/SUSY-HIT-${version}
    cp susyhit-${version}.tar.gz $out/share/SUSY-HIT-${version}
  '';

  meta = {
  };
}
