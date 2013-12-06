{ cabal, fetchgit, haskellPackages, hepNixPackages }:

with { hs = haskellPackages; my = hepNixPackages; };

cabal.mkDerivation (self: {
  pname = "LHE-sanitizer";
  version = "0.999";
  src = fetchgit { url = "https://github.com/hep-platform/LHE-sanitizer.git"; 
                   rev = "5e2902f067c24740a6e342221eeb6a7a4558cc6d";
                   sha256 = "ee230e3d8202689c4294bdbf2750fdd26216cad26a1143eed503e7163d75a32e";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ my.HEPUtil
                   my.conduit-util
                   my.LHEParser
                   hs.mtl
                   hs.transformers
                   # hs.directory
                   hs.conduit
                   hs.xmlConduit
                   hs.attoparsec
                   # hs.containers
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
