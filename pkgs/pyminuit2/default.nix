{ pkgs, Minuit2 }:

with pkgs;

buildPythonPackage rec {
  name = "pyminuit2-${version}";
  version = "1.1.0";
  src = fetchurl {
    url = "https://github.com/jpivarski/pyminuit2/archive/1.1.0.tar.gz";
    sha256 = "0mqicwq8lgh683y891acip860nx54bv5is1ma827qf6yyhif4z5v";
  };
  buildInputs = [ python Minuit2 ];
  doCheck = false;

  preConfigure = ''
    substituteInPlace setup.py --replace "libdirs = ['/usr/lib', '/usr/local/lib']" "libdirs = ['/usr/lib', '/usr/local/lib'] + ['${Minuit2}/lib']"
  '';
}
