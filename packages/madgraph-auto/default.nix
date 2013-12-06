{ cabal, fetchgit, haskellPackages, hepNixPackages }:

with { hs = haskellPackages; my = hepNixPackages; };

cabal.mkDerivation (self: {
  pname = "madgraph-auto";
  version = "0.999";
  src = fetchgit { url = "https://github.com/hep-platform/madgraph-auto.git"; 
                   rev = "fa3f63a4029608e9a289ebb760594f9c8cd2c6f9";
                   sha256 = "7bf73368ec34b4cb67adcce4415c1ea29a365d26d4bce612f10d0e984bf5f6f6";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ my.LHE-sanitizer
                   my.webdav-manager
                   hs.process
                   hs.unix
                   hs.filepath
                   hs.mtl
                   hs.aeson
                   hs.text
                   hs.unordered-containers
                   hs.transformers
                   hs.HStringTemplate
                   hs.devadmin
                 ];
  doCheck = false;
  meta = {
    homepage = "http://github.com/hep-platform";
    description = "automated program library for madgraph run";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
