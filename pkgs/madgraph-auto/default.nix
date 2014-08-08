{ cabal, stdenv, fetchgit, haskellPackages, LHE-sanitizer, webdav-manager, devadmin }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "madgraph-auto";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/madgraph-auto.git"; 
                   rev = "d492084787f1e4852d49b9f76d42e1f77ff07513";
                   sha256 = "cd997cb29d25bc113a6c71d4dd3b0b22701b4ca11951921f5bd96807e297335f";
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
