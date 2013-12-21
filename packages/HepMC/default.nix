# { stdenv, fetchurl, cmake, texLive, doxygen }:
{ stdenv, fetchurl, m4, automake, autoconf, libtool, utillinux, texLive, texLiveExtra, doxygen }:
 
stdenv.mkDerivation { 
  name = "HepMC"; 
  version = "2.06.08";
  src = fetchurl { 
    url = "http://lcgapp.cern.ch/project/simu/HepMC/download/HepMC-2.06.08.tar.gz";
    sha256 = "1km8m0xkx6igz2rp5yvm5sjnczny8r5vd2xqvl3my10a7rww3rlb";
  };
  nativeBuildInputs = [ m4 autoconf automake libtool utillinux texLive texLiveExtra doxygen ];
  patches = [ ./no-doc-gen.patch ];
  configureFlags = "--with-momentum=GEV --with-length=MM";
  # cmakeFlags = "-Dmomentum:STRING=GEV -Dlength:STRING=MM";
  # cmakeBuildDir = "iwbuild";
  # buildInputs = [ cmake texLive ]; # doxygen ]; 
  # checkTarget = "test";
  # buildInputs = [ automake autoconf libtool utillinux texLive doxygen ]; 
  # patches = [./no-sys-dirs.patch ] ;
  # builder = "${src}/bootstrap"; # libtool + "/bin/libtoolize"; # automake + "/bin/aclocal";
  preConfigure = ''
sh ${./preconfigure.sh} 
'';
}
