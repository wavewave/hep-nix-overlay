{ cabal, fetchgit, haskellPackages, HEPUtil }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "conduit-util";
  version = "0.999";
  src = fetchgit { url = "https://github.com/hep-platform/conduit-util.git"; 
                   rev = "7b2457fcdb2ccb1e0360a3c68808043e337e7360";
                   sha256 = "45b43bff12e8615e8f7dad253e1e6a2db8c833759b8970e833107222956b95ab";
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
