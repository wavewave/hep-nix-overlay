{ pkgs, HepMC, FastJet }:

with pkgs;

stdenv.mkDerivation rec {
  name = "SHERPA-${version}";
  version = "2.1.1";
  src = fetchurl {
    url = "https://www.hepforge.org/archive/sherpa/SHERPA-MC-2.1.1.tar.gz";
    sha256 = "0s38d66wd6mk2sxnipzrrcf3d3j2hw985vwawvipbppwxap9m04s";
  };
  buildInputs = [ gfortran sqlite zlib ];
  enableParallelBuilding = true;

  configureFlags = "--disable-pyext --enable-hepmc2=${HepMC} --enable-fastjet=${FastJet} --enable-gzip --with-sqlite3=${sqlite}";
}
