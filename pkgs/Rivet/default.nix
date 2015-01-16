{ stdenv, fetchurl, libtool, m4, automake, autoconf, gsl, boost, HepMC, FastJet, libyamlcppPIC, python, swig}:
 
stdenv.mkDerivation rec { 
  name = "Rivet-${version}"; 
  version = "2.2.0";

  src = fetchurl { 
    url="http://www.hepforge.org/archive/rivet/Rivet-2.2.0.tar.bz2";
    sha256 ="06mfz2d8cajqp40q4lqxqka2hw69knxcd2qc9rrw8m7z0whgxniv";
    #url = "http://www.hepforge.org/archive/rivet/Rivet-1.8.1.tar.gz";
    #sha256 = "1gn0dlhvxfnv5wm2r5f311j757x4l8lr51jhhpgv74xlks020vwc";
  };
  # patches = [ ./yamlcpp.patch ];

  buildInputs = [ libtool m4 automake autoconf gsl boost HepMC FastJet 
                  libyamlcppPIC python swig];
  
  preConfigure = ''
    autoreconf
  '';



  configureFlags = "CFLAGS=-fPIC CXXFLAGS=-fPIC --with-boost=${boost} --with-hepmc=${HepMC} --with-fastjet=${FastJet} --with-yaml_cpp=${libyamlcppPIC}  --disable-pyext";

  meta = { 
    priority  = "10";
  };
}
