{ pkgs, ROOT
, darwin ? null
}:

with pkgs;

stdenv.mkDerivation rec {
  name = "mt2_cwrapper-${version}";
  version = "0.2.0.0";
  src = fetchgit {
    url = "https://github.com/cbpark/mt2_cwrapper.git";
    rev = "e437098835640724e3bbf08e4b31f1ec7abad455";
    sha256 = "1k4c1bj1nisas1akb3pwwx5wijhivgl0nbhcnbihgnhh8lc4sx3v";
  };
  buildInputs = [ cmake ROOT ];
  patches = [ ];
  enableParallelBuilding = true;
  preConfigure = ''
    substituteInPlace cmake/Modules/FindROOT.cmake --replace "\$ENV{ROOTSYS}/bin" "${ROOT}/bin"
  '';
  cmakeFlags = [] ++ (if stdenv.isDarwin then [ "-DCMAKE_OSX_DEPLOYMENT_TARGET=" ] else []);
}
