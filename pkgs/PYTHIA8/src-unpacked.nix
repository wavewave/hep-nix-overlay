{ stdenv, PYTHIA8-src }:
 
stdenv.mkDerivation rec { 
  name = "PYTHIA8-src-unpacked-${version}"; 
  version = "180";
  src = PYTHIA8-src;
  buildInputs = [];
  enableParallelBuilding = true; 
  phases = [ "unpackPhase" "installPhase" ] ;  
  installPhase = '' 
    cd ..
    mkdir $out
    cp -a pythia8180/* $out/
  ''; 
}
