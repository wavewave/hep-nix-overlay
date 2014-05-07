{ cabal, fetchgit, haskellPackages, HEPUtil, conduit-util, LHEParser }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "LHE-sanitizer";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/LHE-sanitizer.git"; 
                   rev = "b0a778d560b42255dbf0b4ed46168d864d322101";
                   sha256 = "aa361e90709b27d76fdcd80cbfaacd24f0b49721a2f737ed5e73005ba106cf72";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ HEPUtil
                   conduit-util
                   LHEParser
                   hs.mtl
                   hs.transformers
                   hs.conduit
                   hs.xmlConduit
                   hs.attoparsec
                   hs.text
                   hs.pureMD5
                   hs.random
                   hs.randomShuffle
                 ];
  doCheck = false;
  meta = {
    homepage = "http://github.com/hep-platform";
    description = "sanitizing LHE file for feeding PYTHIA";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
