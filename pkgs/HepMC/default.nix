{ stdenv, fetchurl, m4, automake, autoconf, libtool }: 

stdenv.mkDerivation rec { 
  name = "HepMC-${version}"; 
  version = "2.06.08";
  src = fetchurl { 
    url = "http://lcgapp.cern.ch/project/simu/HepMC/download/HepMC-2.06.08.tar.gz";
    sha256 = "1km8m0xkx6igz2rp5yvm5sjnczny8r5vd2xqvl3my10a7rww3rlb";
  };
  nativeBuildInputs = [ m4 autoconf automake libtool ]; # texLive texLiveExtra doxygen ];
  patches = [ ./no-doc-gen.patch ];
  configureFlags = "--with-momentum=GEV --with-length=MM --enable-static";
  preConfigure = ''
sh ${./preconfigure.sh} 
'';
}
