{ cabal, stdenv, fetchgit, haskellPackages, madgraph-auto, HEPUtil, devadmin }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "madgraph-auto-model";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/madgraph-auto-model.git"; 
                   rev = "68396f41b0d453eb6e9b5ce6046fac4f8a48861c";
                   sha256 = "51f24ce59e481f3ad7c016292b8e2fca0896f9ab1a9380d452019f0bfa19b14b";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ madgraph-auto
                   HEPUtil
                   devadmin
                   hs.mtl
                   hs.HStringTemplate
                   hs.pureMD5
                   hs.parsec
                 ];
  doCheck = false;
  meta = {
    homepage = "http://github.com/hep-platform";
    description = "automated program library for madgraph run";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
