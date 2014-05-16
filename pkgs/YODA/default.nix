{ stdenv, fetchurl, boost, python }:
 
stdenv.mkDerivation rec { 
  name = "YODA-${version}"; 
  version = "1.0.6";

  src = fetchurl { 
    url = "http://www.hepforge.org/archive/yoda/YODA-1.0.6.tar.gz";
    #md5 = "0b3315b7ebfcfdcd0f2b973bca426d68";
    sha256 = "0543zgnqv75ff5npz25djwrjpc0vzkghhgs0x21kmhwlk8mpc1m2";
  };
  #patches = [ ]; 

  buildInputs = [ boost python ];
  enableParallelBuilding = true; 

  #preConfigure = "" ; 

  configureFlags = "--with-boost=${boost}";

  meta = { 

  };

}
