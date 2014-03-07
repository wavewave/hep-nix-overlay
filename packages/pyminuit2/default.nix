{ stdenv, fetchurl, python, buildPythonPackage, pythonPackages, root5 }:
 
buildPythonPackage rec { 
  name = "pyminuit2-${version}"; 
  version = "1.1.0";
  src = fetchurl { 
    url = "https://pyminuit2.googlecode.com/files/pyminuit2-1.1.0.tar.gz";
    sha256 = "1969lmz077v38ywk1chg9rpxpdca99rvhbm6bjpd76v004nckybq";
  };
  buildInputs = [ python root5 ];
  doCheck = false;
}
