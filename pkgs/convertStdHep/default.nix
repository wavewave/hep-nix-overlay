{ pkgs, HepMC }:

with pkgs;

stdenv.mkDerivation rec {
  name = "convertStdHep-${version}";
  version = "0.02.00";
  src = fetchurl {
    url = "http://cepa.fnal.gov/psm/stdhep/dist/convertStdHep-0.02.00.tar.gz";
    sha256 = "0h4nbb54z0a825ncgh5zbwrk465vv6p9czpxl3pg9pb7cz5kig01";
  };
  patches = [ ./convertStdHep-0.02.00-p01.patch
              ./mcfio_upgrade.patch
            ];
  buildInputs = [ gfortran HepMC ];
  enableParallelBuilding = true;

  configureFlags = "--with-HepMC=${HepMC} AR=${binutils}/bin/ar ARFLAGS=cru";
}
