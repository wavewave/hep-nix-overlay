{ cabal, stdenv, fetchgit, haskellPackages, LHE-sanitizer, webdav-manager, devadmin }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "madgraph-auto";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/madgraph-auto.git"; 
                   rev = "127c8ea0f9fde07cc478244d5358a875fe0261fe";
                   sha256 = "0b9502d9d05936548e913001cb07d623e63f71b155138d2d9956c01acca5475c";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ LHE-sanitizer
                   webdav-manager
                   devadmin
                   hs.filepath
                   hs.mtl
                   hs.aeson
                   hs.text
                   hs.unorderedContainers
                   hs.transformers
                   hs.HStringTemplate
                   hs.hslogger
                   hs.hashable 
                 ];
  doCheck = false;
  jailbreak = true; 
  meta = {
    homepage = "http://github.com/hep-platform";
    description = "automated program library for madgraph run";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
