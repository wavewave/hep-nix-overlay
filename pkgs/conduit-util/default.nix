{ cabal, fetchgit, haskellPackages, HEPUtil }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "conduit-util";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/conduit-util.git"; 
                   rev = "83d4cff79855d9bae6ef97e8ac16f4e99a9dce1c";
                   sha256 = "49844e06b933b098af8e7a3ef69bc902333c2eef0fa041e779926be698828bd8";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ HEPUtil
                   hs.conduit
                   hs.mtl
                   hs.MaybeT
                   hs.xmlConduit
                   hs.xmlTypes
                   hs.transformers
                   hs.void
                 ];
  doCheck = false;
  meta = {
    homepage = "";
    description = "utility functions for conduit and related packages";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
