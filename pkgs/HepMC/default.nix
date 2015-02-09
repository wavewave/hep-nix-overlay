{ stdenv, fetchurl, cmake }:

stdenv.mkDerivation rec {
  name = "HepMC-${version}";
  version = "2.06.08";
  src = fetchurl {
    url = "http://lcgapp.cern.ch/project/simu/HepMC/download/HepMC-2.06.08.tar.gz";
    sha256 = "1km8m0xkx6igz2rp5yvm5sjnczny8r5vd2xqvl3my10a7rww3rlb";
  };
  patches = [ ./in_source_error.patch ];
  buildInputs = [ cmake ];
  enableParallelBuilding = true;

  cmakeFlags = [
    "-Dmomentum:STRING=GEV"
    "-Dlength:STRING=MM"
  ];
}
