{ stdenv, fetchurl, python, buildPythonPackage, pythonPackages }:
 
buildPythonPackage rec { 
  name = "professor"; 
  version = "1.3.3";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/professor/professor-1.3.3.tar.bz2";
    sha256 = "1kajmwvwiciy8z8wvf0flbnlm0cqw56zzv2xqpqsd21jxh1ybfrj";
  };
  buildInputs = [ python pythonPackages.matplotlib pythonPackages.scipy ];
  buildPhase = 
    '' 
      python ./setup.py build
    ''; 

#  installPhase = 
#    ''
#      python ./setup.py install --prefix=$out
#    ''; 

  #configureFlags = "--with-hepmc=${HepMC} --with-fastjet=${FastJet}";
}
