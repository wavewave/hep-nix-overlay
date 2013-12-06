{ cabal, fetchgit, haskellPackages, hepNixPackages, gfortran}:

with { hs = haskellPackages; my = hepNixPackages; };

cabal.mkDerivation (self: {
  pname = "LHEParser";
  version = "0.999";
  src = fetchgit { url = "https://github.com/hep-platform/LHEParser.git"; 
                   rev = "5f0347655de02e84f60ab7ff5ed2824a43c88eb9";
                   sha256 = "4b85c8cac8218d0834b048c823c3c4244de3d70f9650e0253b723fa9a8bc0c70";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ my.HEPUtil
                   my.conduit-util
                   gfortran
                   hs.mtl
                   hs.attoparsec
                   hs.bytestringLexing
                   # hs.containers
                   hs.text
                   hs.xmlTypes
                   hs.conduit
                   hs.xmlConduit
                   hs.transformers
                 ];
  doCheck = false;
  meta = {
    homepage = "http://github.com/hep-platform";
    description = "Les Houches Event file format parser";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
