{ pkgs, ROOT
, darwin ? null
}:

with pkgs;

stdenv.mkDerivation rec {
  name = "mt2_cwrapper-${version}";
  version = "0.1.0.0";
  src = fetchurl {
    url = "https://github.com/cbpark/mt2_cwrapper/archive/v0.1.0.0.tar.gz";
    sha256 = "0fy2qmp2ydva5hjzj67z5j7i58aaqja7ci9brwszsipcfb9m6fw2";
  };
  buildInputs = [ cmake ROOT ] ++ (if stdenv.isDarwin then [ darwin.sw_vers ] else []);
  patches = [ ];
  enableParallelBuilding = true;
  preConfigure = ''
    substituteInPlace cmake/Modules/FindROOT.cmake --replace "\$ENV{ROOTSYS}/bin" "${ROOT}/bin"
  '';
  cmakeFlags = [] ++ (if stdenv.isDarwin then [ "-DCMAKE_OSX_DEPLOYMENT_TARGET=" ] else []);
}
