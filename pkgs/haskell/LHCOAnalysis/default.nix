{ mkDerivation, stdenv, fetchgit, LHCOAnalysis-type 
, mtl, bytestring-lexing, split, text, attoparsec }:

mkDerivation {
  pname = "LHCOAnalysis";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/LHCOAnalysis.git"; 
                   rev = "4c9eedbe00fa11d63df24ae2b0472416e8e77252";
                   sha256 = "e1c071f561afc8c8f22ecd46dba92ca02979396184effdf0d9b7dd3460c9db05";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ mtl bytestring-lexing split 
                   LHCOAnalysis-type text attoparsec
                 ];
  doCheck = false;
  license = stdenv.lib.licenses.bsd3;
}
