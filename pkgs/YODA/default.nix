{ stdenv, fetchurl, boost, python }:
 
stdenv.mkDerivation rec { 
  name = "YODA-${version}"; 
  version = "1.3.0";

  src = fetchurl { 
    url = "http://www.hepforge.org/archive/yoda/YODA-1.3.0.tar.gz";
    sha256 = "052syrhwxbrcj2q1qs171cv8hblvs9xla8rkcwy8bzdaqdnia3rj";
  };

  buildInputs = [ boost python ];
  enableParallelBuilding = true; 

  configureFlags = "--with-boost=${boost}";

  meta = { 

  };

}
