{ stdenv, cmake }:
 
stdenv.mkDerivation rec { 
  name = "root5-minimal-${version}";
  version = "34.18";
  enableParallelBuilding = true;
  buildInputs = [ cmake ];
  dontUseCmakeConfigure = true;
}


