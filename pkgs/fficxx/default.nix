{ cabal, fetchgit, HStringTemplate, either, errors, lens, pureMD5, split }:

cabal.mkDerivation (self: {
  pname = "fficxx";
  version = "0.2";
  src = fetchgit { url = "https://github.com/wavewave/fficxx.git"; 
                   rev = "64e4ea1dc3d95a44eed02e8d1cb371bc0350ecef";
                   sha256 = "0fca8ab21c3123d18fdbfa8d55f2319d7b6ff9d218509e6fbf2ea74896eec327";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ HStringTemplate
                   either
                   errors
                   lens
                   pureMD5
                   split
                
                 ];
  doCheck = false;
  meta = {
    homepage = "http://ianwookim.org/fficxx";
    description = "automatic C++ binding generation";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
