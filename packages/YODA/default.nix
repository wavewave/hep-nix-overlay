{ stdenv, fetchurl, boost, python }:
 
stdenv.mkDerivation { 
  name = "YODA"; 
  version = "1.0.4";

  src = fetchurl { 
    url = "http://www.hepforge.org/archive/yoda/YODA-1.0.4.tar.gz";
    md5 = "0b3315b7ebfcfdcd0f2b973bca426d68";
  };
  #patches = [ ]; 

  buildInputs = [ boost python ];
  enableParallelBuilding = true; 

  #preConfigure = "" ; 

  configureFlags = "--with-boost=${boost}";

  meta = { 

  };

}
