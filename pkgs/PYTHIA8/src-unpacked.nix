{ stdenv, PYTHIA8-src }:

stdenv.mkDerivation rec {
  name = "PYTHIA8-src-unpacked-${version}";
  version = "186";
  src = PYTHIA8-src;
  patches = [ ./lhapdf6.patch ];
  buildInputs = [];
  enableParallelBuilding = true;
  phases = [ "unpackPhase" "patchPhase" "installPhase" ] ;
  installPhase = ''
    cd ..
    mkdir $out
    cp -a pythia8186/* $out/
  '';
}
