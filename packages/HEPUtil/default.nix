{ cabal, fetchgit, haskellPackages, hepNixPackages }:

with { hs = haskellPackages; my = hepNixPackages; };

cabal.mkDerivation (self: {
  pname = "HEPUtil";
  version = "0.999";
  src = fetchgit { url = "https://github.com/hep-platform/HEPUtil.git"; 
                   rev = "98b6bd6309a9a2a42eda03bc0211e3b0cb40cd51";
                   sha256 = "b8fe3b50e4295b280d938ea54c90c716d5e7d9d6f81bfbda8aa68cd0a6acd4d6";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ my.LHCOAnalysis-type
                   hs.mtl
                   hs.filepath
                   hs.split
                   hs.parsec
                   hs.either
                   hs.transformers
                   hs.hmatrix 
                 ];
  doCheck = false;
  meta = {
    homepage = "";
    description = "Collection of useful functions for High Energy Physics project";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
