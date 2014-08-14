{ stdenv, PYTHIA8-src }:
 
stdenv.mkDerivation rec { 
  name = "PYTHIA8-${version}"; 
  version = "180";
  src = PYTHIA8-src;
  buildInputs = [ ];
  enableParallelBuilding = true; 
  #configureFlags = "--with-thepeg=${ThePEG} --with-fastjet=${FastJet} ";
}
