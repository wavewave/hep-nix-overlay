{ cabal, fetchgit, haskellPackages, LHCOAnalysis-type }:

with haskellPackages;  

cabal.mkDerivation (self: {
  pname = "LHCOAnalysis";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/LHCOAnalysis.git"; 
                   rev = "358935cc82def17ce3769c566fd9207be769bd1e";
                   sha256 = "f217929f0c9a257741c345fd99aebf2cd8df5e4b126bbbea77da14259d018317";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ mtl bytestringLexing split 
                   LHCOAnalysis-type text attoparsec
                 ];
  doCheck = false;
  meta = {
    homepage = "";
    description = "LHCOAnalysis: LHC Olympics File parser and utilities";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
