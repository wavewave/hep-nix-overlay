{ pkgs }:

with pkgs;

stdenv.mkDerivation rec { 
  name = "Geant4-${version}";
  version = "10.01";
  src = fetchurl { 
    url = "http://geant4.cern.ch/support/source/geant4.10.01.p01.tar.gz";
    sha256 = "19fdc5ddxzrqlqv71sil2yhfvdw52pzv6fvbdnfxmpnw6pv27kmr";
  };
  enableParallelBuilding = true;
  buildInputs = [ cmake expat ]; 
  patches = [ ]; 
  #preConfigure = ""; 
  cmakeFlags = "-DGEANT4_INSTALL_DATA=OFF"; 

}

