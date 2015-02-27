{ cabal, stdenv, fetchgit, haskellPackages, LHE-sanitizer, webdav-manager, devadmin }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "madgraph-auto";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/madgraph-auto.git"; 
                   rev = "149515cde102cab47b68cebf30f0590cecd26728";
                   sha256 = "8069e28718008c2b7c311a5c24feeef93f48771ce79c434f2e528ba20da88ab3";
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
