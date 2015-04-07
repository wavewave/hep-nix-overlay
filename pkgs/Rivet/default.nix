{ pkgs, HepMC, FastJet, libyamlcppPIC, YODA }:

with pkgs;

stdenv.mkDerivation rec {
  name = "Rivet-${version}";
  version = "2.2.1";
  src = fetchurl {
    url="http://www.hepforge.org/archive/rivet/Rivet-2.2.1.tar.bz2";
    sha256 ="14dnabks36as8hsd0w01r7zbaqs33i4kbd22rk8g9gb7slcvlr4y";
  };

  buildInputs = [ libtool m4 automake autoconf gsl boost python swig
                  HepMC FastJet libyamlcppPIC YODA ];
  enableParallelBuilding = true;

  preConfigure = ''
    autoreconf
  '';

  configureFlags = "CFLAGS=-fPIC CXXFLAGS=-fPIC --with-boost=${boost.dev} --with-hepmc=${HepMC} --with-fastjet=${FastJet} --with-yaml_cpp=${libyamlcppPIC} --with-yoda=${YODA} --disable-pyext";

  meta = {
    priority  = "10";
  };
}
