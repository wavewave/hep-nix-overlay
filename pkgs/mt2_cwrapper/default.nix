{ pkgs, ROOT
, darwin ? null
}:

with pkgs;

stdenv.mkDerivation rec {
  name = "mt2_cwrapper-${version}";
  version = "0.2.0.0";
  src = fetchgit {
    url = "https://github.com/cbpark/mt2_cwrapper.git";
    rev = "5bcd77f222f1aa0b9727f82c85e1f6413c959647";
    sha256 = "12hwk41iwh4yz8f7kffq0vb541pr2vpn9ah5mkgky758ka7iqkz0";
  };
  buildInputs = [ cmake ROOT ];
  patches = [ ];
  enableParallelBuilding = true;
  preConfigure = ''
    substituteInPlace cmake/Modules/FindROOT.cmake --replace "\$ENV{ROOTSYS}/bin" "${ROOT}/bin"
  '';
  cmakeFlags = [] ++ (if stdenv.isDarwin then [ "-DCMAKE_OSX_DEPLOYMENT_TARGET=" ] else []);
}
