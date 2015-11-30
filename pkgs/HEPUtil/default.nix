{ mkDerivation, stdenv, fetchgit, LHCOAnalysis-type 
, mtl, filepath, split, parsec, either, transformers, hmatrix, ghc-paths }:

mkDerivation {
  pname = "HEPUtil";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/HEPUtil.git"; 
                   rev = "1e1d6d56cfbf7f3ea7db02e3bf220cbf34136087";
                   sha256 = "f3a82b844fa6295476e58c3e98c89f45f18beb676891a4a45d4ce426501137bc";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ LHCOAnalysis-type
                   mtl
                   filepath
                   split
                   parsec
                   either
                   transformers
                   hmatrix 
                   ghc-paths
                 ];
  doCheck = false;
  jailbreak = true;
  license = stdenv.lib.licenses.bsd3;
}
