{ pkgs, PYTHIA8-src, HepMC, LHAPDF6 }:

pkgs.stdenv.mkDerivation rec {
  name = "PYTHIA8-${version}";
  version = "186";
  src = PYTHIA8-src;
  buildInputs = [ HepMC LHAPDF6 ];
  enableParallelBuilding = true;

  preConfigure = ''
    substituteInPlace configure --replace /bin/sh ${pkgs.bash}/bin/bash
  '';

  configureFlags = "--with-hepmc=${HepMC} --with-hepmcversion=${HepMC.version}";
}


# "--with-thepeg=${ThePEG} --with-fastjet=${FastJet} ";
