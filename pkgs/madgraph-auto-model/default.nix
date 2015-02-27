{ cabal, stdenv, fetchgit, haskellPackages, madgraph-auto, HEPUtil, devadmin }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "madgraph-auto-model";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/madgraph-auto-model.git"; 
                   rev = "c303faa4e8feb935f7d5eec51505f5214b0fcd75";
                   sha256 = "a08d10ad861015d76c4dddfaace992674099879f26d93b9b01c1370b0fbddf05";
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
