{ cabal, fetchgit, haskellPackages, gfortran, HEPUtil, conduit-util, }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "LHEParser";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/LHEParser.git"; 
                   rev = "aff783cfd0ece0e826ef2e90f68da4c1aa06fe9b";
                   sha256 = "0e658e34fdf1ff8541c6fced4d5c8d5a0b7b068b886cad7a2ef1641b4f21baa6";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ HEPUtil
                   conduit-util
                   gfortran
                   hs.mtl
                   hs.attoparsec
                   hs.bytestringLexing
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
