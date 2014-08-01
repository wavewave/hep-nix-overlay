{ cabal, fetchgit, haskellPackages, gfortran, HEPUtil, conduit-util, }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "LHEParser";
  version = "0.999.0";
  src = fetchgit { url = "https://github.com/wavewave/LHEParser.git"; 
                   rev = "f0d438e6313c2e43fd18c86847379e92e7887cf5";
                   sha256 = "144b56ee69ff44d5ca77f43646ebdc33f0c6bf02aa7777385669628c0b3dbd81";
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
