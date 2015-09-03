{ pkgs, ROOT
, darwin ? null
}:

with pkgs;

stdenv.mkDerivation rec {
  name = "mt2_cwrapper-${version}";
  version = "0.2.0.0";
  src = fetchgit {
    url = "https://github.com/cbpark/mt2_cwrapper.git";
    rev = "c6600fc12d31287f38cb52c903dc2f1116db0fbe";
    sha256 = "0mzwqsmh9v408gc12z7xa5qv5lnisgyazivqy8ggrlsw9a3nlwc9";
  };
  buildInputs = [ cmake ROOT ];
  patches = [ ];
  enableParallelBuilding = true;
  preConfigure = ''
    substituteInPlace cmake/Modules/FindROOT.cmake --replace "\$ENV{ROOTSYS}/bin" "${ROOT}/bin"
  '';
  cmakeFlags = [] ++ (if stdenv.isDarwin then [ "-DCMAKE_OSX_DEPLOYMENT_TARGET=" ] else []);
}
