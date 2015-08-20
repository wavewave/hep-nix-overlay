{ ExRootAnalysis, root5 }:

let pkgs = import <nixpkgs> {};
    stdenv = pkgs.stdenv;
    version = ExRootAnalysis.version;
in rec {
  ExRootAnalysisEnv = stdenv.mkDerivation {
    name = "ExRootAnalysis-${version}";
    buildInputs = [ stdenv ExRootAnalysis root5 ];
    LD_LIBRARY_PATH = "${ExRootAnalysis}/lib:${root5}/lib";
  };
}
