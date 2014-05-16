{ stdenv, fetchurl, python, buildPythonPackage, pythonPackages, pyminuit2 }:
 
buildPythonPackage rec { 
  name = "professor-${version}"; 
  version = "1.3.3";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/professor/professor-1.3.3.tar.bz2";
    sha256 = "1kajmwvwiciy8z8wvf0flbnlm0cqw56zzv2xqpqsd21jxh1ybfrj";
  };
  patches = [ ./no-private-dep-build.patch ];
  buildInputs = [ python 
                  # pythonPackages.matplotlib 
                  pythonPackages.scipy 
                  pyminuit2 ];
#  buildPhase = 
#    '' 
#      python ./setup.py build
#    ''; 

#  installCommand = 
#    ''
#      pwd; echo "IWKIM"; TEMP=. easy_install --always-unzip --prefix="$out" . 
#    ''; 
  doCheck = false; 
  #configureFlags = "--with-hepmc=${HepMC} --with-fastjet=${FastJet}";
}
