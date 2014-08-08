{ cabal, fetchgit, haskellPackages, LHCOAnalysis-type }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "HEPUtil";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/HEPUtil.git"; 
                   rev = "bc16e245bf6e7d74ec18d59eff24db1d188234b0";
                   sha256 = "0a3fe7fcbdfbb789cade4d9ea62828e6ad8883388911a405b7a69e39569abc7b";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ LHCOAnalysis-type
                   hs.mtl
                   hs.filepath
                   hs.split
                   hs.parsec
                   hs.either
                   hs.transformers
                   hs.hmatrix 
                   hs.ghcPaths
                 ];
  doCheck = false;
  jailbreak = true;
  meta = {
    homepage = "";
    description = "Collection of useful functions for High Energy Physics project";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
