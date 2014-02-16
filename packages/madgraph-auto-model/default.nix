{ cabal, stdenv, fetchgit, haskellPackages, madgraph-auto, HEPUtil, devadmin }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "madgraph-auto-model";
  version = "0.999";
  src = fetchgit { url = "https://github.com/hep-platform/madgraph-auto-model.git"; 
                   rev = "91d7b38c70dd2e1d6610188dc0cf28dce50f6069";
                   sha256 = "cb1c1199cadaedafb99d4cbd3c9526ae9203b742dde35056cb61c6b81d69de55";
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
