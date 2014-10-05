{ stdenv, PYTHIA8-src, HepMC }:
 
stdenv.mkDerivation rec { 
  name = "PYTHIA8-${version}"; 
  version = "180";
  src = PYTHIA8-src;
  buildInputs = [ HepMC ];
  enableParallelBuilding = true; 
  
  configureFlags = "--with-hepmc=${HepMC} --with-hepmcversion=${HepMC.version}"; 
}


# "--with-thepeg=${ThePEG} --with-fastjet=${FastJet} ";