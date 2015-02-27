{ stdenv, fetchurl, python, boost }:

stdenv.mkDerivation rec {
  name = "LHAPDF-${version}";
  version = "6.1.5";
  src = fetchurl {
    url = "http://www.hepforge.org/archive/lhapdf/LHAPDF-6.1.5.tar.gz";
    sha256 = "0c9jz2zgmlqx8d4cpi25k6plw7aka4nnmjr8dfb6qf1aqg0zlpgf";
  };
  buildInputs = [ python boost ] ++ stdenv.lib.optional stdenv.isDarwin [ stdenv.cc.libc ] ;
  enableParallelBuilding = true;

  configureFlags = "--with-boost=${boost.dev} "  + stdenv.lib.optionalString stdenv.isDarwin " CXXFLAGS=-stdlib=libc++ ";
   
  preConfigure = if stdenv.isDarwin 
    then ''
      substituteInPlace wrappers/python/setup.py.in --replace stdc++  c++
    '' 
    else "";

  meta = {
  };
}


#  