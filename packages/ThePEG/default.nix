{ stdenv, fetchurl, gsl, zlib, HepMC, LHAPDF, Rivet, FastJet }:
 
stdenv.mkDerivation { 
  name = "ThePEG"; 
  version = "1.9.0";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/thepeg/ThePEG-1.9.0.tar.bz2";
    sha256 = "0p8af2jdbn6pil0jzrr2yf38w8nzf35116hvvxkla61679g8xr9y"; 
  };
  buildInputs = [ gsl zlib HepMC LHAPDF Rivet FastJet ];
  configureFlags = "--with-zlib=${zlib} --with-lhapdf=${LHAPDF} --with-hepmc=${HepMC} --with-rivet=${Rivet} --with-fastjet=${FastJet} " ;  
}
