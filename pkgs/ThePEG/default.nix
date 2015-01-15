{ stdenv, fetchurl, gsl, zlib, HepMC, LHAPDF, FastJet
, libyamlcppPIC }:
 
stdenv.mkDerivation rec { 
  name = "ThePEG-${version}"; 
  version = "1.9.2";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/thepeg/ThePEG-1.9.2.tar.bz2";
    sha256 = "1x7s8d9rlh80lg4i3py3mbnp09idr5bizpjaw3d99yb6d0jvnyzz";
             # "0p8af2jdbn6pil0jzrr2yf38w8nzf35116hvvxkla61679g8xr9y"; 
  };
  enableParallelBuilding = true; 

  patches = if (stdenv.isDarwin ) 
            then [ ./gsldylib.patch ]
            else [ ./find-dynamic-gsl.patch ];
  buildInputs = [ gsl zlib HepMC LHAPDF FastJet libyamlcppPIC ];

  configureFlags = "--with-zlib=${zlib} --with-gsl=${gsl} --with-lhapdf=${LHAPDF} --with-hepmc=${HepMC}  --with-fastjet=${FastJet} " ;  
}

