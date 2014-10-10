{ stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "FastJet-${version}";
  version = "3.1.0";
  src = fetchurl {
    url = "http://fastjet.fr/repo/fastjet-3.1.0.tar.gz";
    sha256 = "0qr20sm6r2k0yakndaf2alk5bk7826wi0h31nw4z095izlfp1p7q";
  };
  enableParallelBuilding = true;
  configureFlags = "--enable-allcxxplugins";

  meta = {
  };
}
