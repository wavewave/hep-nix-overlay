{ pkgs, stdenv, fetchurl, libX11, gfortran }:

with pkgs;

stdenv.mkDerivation rec {
  name = "CalcHEP-${version}";
  version = "3.6.15";
  src = fetchurl {
    url = "http://theory.sinp.msu.ru/~pukhov/CALCHEP/calchep_3.6.15.tgz";
    sha256 = "0mhpyxlh2qvg2yl329db1vg8cnydj32046hbxyppc0kggpwx4n2z";
  };
  patches = [ ];
  buildInputs = [ gfortran libX11 which ];
  enableParallelBuilding = false;

  installPhase = ''
    sed "2s,.*,CALCHEP=$out," mkWORKdir > mkWORKdir_patched
    mv mkWORKdir_patched mkWORKdir
    chmod 755 mkWORKdir
    mkdir -p $out
    cp -r * $out
  '';
}
