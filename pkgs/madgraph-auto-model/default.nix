{ cabal, stdenv, fetchgit, haskellPackages, madgraph-auto, HEPUtil, devadmin }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "madgraph-auto-model";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/madgraph-auto-model.git"; 
                   rev = "3a80bff6a9f6b328e76a6eb05b978c101b938c9e";
                   sha256 = "34c18f712aac3e6067a8d51e0a0d557796082262be128a5062b8f5a402571019";
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
