{ stdenv, fetchurl, gsl, boost, HepMC, FastJet, libyamlcpp025, python, swig}:
 
stdenv.mkDerivation { 
  name = "Rivet"; 
  version = "1.8.3";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/rivet/Rivet-1.8.3.tar.gz";
    sha256 = "053w8mbqmddfl34wb3r27cvgs8fyq5x1431d9l3nmj6317f71dc6";
  };
  buildInputs = [ gsl boost HepMC FastJet libyamlcpp025 python swig];
  configureFlags = "--with-hepmc=${HepMC} --with-fastjet=${FastJet} --with-yaml_cpp=${libyamlcpp025} ";
}
