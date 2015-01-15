{ pkgs, PYTHIA8-src, HepMC, LHAPDF }:
 
pkgs.stdenv.mkDerivation rec { 
  name = "PYTHIA8-${version}"; 
  version = "180";
  src = PYTHIA8-src;
  buildInputs = [ HepMC LHAPDF ];
  enableParallelBuilding = true; 
   
  preConfigure = ''
    substituteInPlace configure --replace /bin/sh ${pkgs.bash}/bin/bash
  '';

  configureFlags = "--with-hepmc=${HepMC} --with-hepmcversion=${HepMC.version}"; 
}


# "--with-thepeg=${ThePEG} --with-fastjet=${FastJet} ";