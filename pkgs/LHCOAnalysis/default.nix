{ cabal, fetchgit, haskellPackages, LHCOAnalysis-type }:

with haskellPackages;  

cabal.mkDerivation (self: {
  pname = "LHCOAnalysis";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/LHCOAnalysis.git"; 
                   rev = "ec6ec1ff8f8bf07e23bc926792ce90642071973c";
                   sha256 = "9943d8fb02748b099b282fd72cb1ee4441511610f0e9815f82391cff068f6697";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ mtl bytestringLexing split 
                   LHCOAnalysis-type
                 ];
  doCheck = false;
  meta = {
    homepage = "";
    description = "LHCOAnalysis: LHC Olympics File parser and utilities";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
