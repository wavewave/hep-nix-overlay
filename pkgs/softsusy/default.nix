{ stdenv, fetchurl, pkgs}: 

stdenv.mkDerivation rec { 
  name = "softsusy-${version}"; 
  version = "3.4.1";
  src = fetchurl { 
    url = "http://www.hepforge.org/archive/softsusy/softsusy-3.4.1.tar.gz";
    sha256 = "1s94gkksb1xyky1bhgcz1qfhl045ygk190i9gm487pq3ixkajv8a";
  };
  buildInputs = [ pkgs.gfortran ];
  enableParallelBuilding = true; 
}
