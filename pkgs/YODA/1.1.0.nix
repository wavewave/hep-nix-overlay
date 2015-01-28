{ stdenv, fetchurl, boost, python }:
 
stdenv.mkDerivation rec { 
  name = "YODA-${version}"; 
  version = "1.1.0";

  src = fetchurl { 
    url = "http://www.hepforge.org/archive/yoda/YODA-1.1.0.tar.gz";
    sha256 = "0f0q1bys6fk1bhajq2n4h41p1hclcackmarb717z20km2z9g0m6h";
  };

  buildInputs = [ boost python ];
  enableParallelBuilding = true; 

  configureFlags = "--with-boost=${boost}";

  meta = { 

  };

}
