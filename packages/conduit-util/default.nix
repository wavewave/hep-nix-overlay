{ cabal, fetchgit, haskellPackages, HEPUtil }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "conduit-util";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/conduit-util.git"; 
                   rev = "29bf8a0a0857fbc5d620841f19d194dfc0fb97ab";
                   sha256 = "4d9bee0c3885b219d4ddc5dafc7585c4de5f9146f4d65f1e23729dac0a353679";
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
