{ mkDerivation, stdenv, fetchgit, binary }:

mkDerivation {
  pname = "LHCOAnalysis-type";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/LHCOAnalysis-type.git"; 
                   rev = "fdd533dd273db372070f55214e269a92d8ad7cf3";
                   sha256 = "9947d6ebbdaadd852172f1b106983b4a6cc11e9e47bba64201314479058fb0a4";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ binary ];
  doCheck = false;
  license = stdenv.lib.licenses.bsd3;
}
