{ stdenv, fetchurl, cmake }:
 
stdenv.mkDerivation { 
  name = "googletest"; 
  version = "1.7.0";

  src = fetchurl { 
    url = "http://googletest.googlecode.com/files/gtest-1.7.0.zip";
    md5 = "2d6ec8ccdf5c46b05ba54a9fd1d130d7";
  };
  #patches = [ ]; 

  buildInputs = [ ];
  #pkgconfigDepends = [ ] ;
  enableParallelBuilding = true; 

  #preConfigure = "" ; 

  cmakeFlags = "-Dgtest_force_shared_crt=ON -DGTEST_LANG_CXX11=ON ";

  meta = { 

  };

}
