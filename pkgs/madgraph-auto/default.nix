{ cabal, stdenv, fetchgit, haskellPackages, LHE-sanitizer, webdav-manager, devadmin }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "madgraph-auto";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/madgraph-auto.git"; 
                   rev = "a5ad927b11ed9d0e7476b98415c19544adae62a4";
                   sha256 = "9143cbba858495a02e411909ad7ec7e93d9cc67951a40e72401b74a64a1187f9";
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
