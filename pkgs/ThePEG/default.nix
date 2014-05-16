{ stdenv, fetchurl, gsl, zlib, HepMC, LHAPDF, FastJet
, libyamlcppPIC }:
 
#, Rivet

stdenv.mkDerivation rec { 
  name = "ThePEG-${version}"; 
  version = "1.9.0";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/thepeg/ThePEG-1.9.0.tar.bz2";
    sha256 = "0p8af2jdbn6pil0jzrr2yf38w8nzf35116hvvxkla61679g8xr9y"; 
  };
  enableParallelBuilding = true; 

  patches = [ ./find-dynamic-gsl.patch ];
  buildInputs = [ gsl zlib HepMC LHAPDF FastJet libyamlcppPIC ];
#Rivet
  configureFlags = "--with-zlib=${zlib} --with-gsl=${gsl} --with-lhapdf=${LHAPDF} --with-hepmc=${HepMC}  --with-fastjet=${FastJet} " ;  
}

# --with-rivet=${Rivet}