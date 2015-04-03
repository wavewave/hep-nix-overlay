{ cabal, fetchgit, HStringTemplate, either, errors, lens, pureMD5, split }:

cabal.mkDerivation (self: {
  pname = "fficxx";
  version = "0.2";
  src = fetchgit { url = "https://github.com/wavewave/fficxx.git"; 
                   rev = "f2fe80f71a7c9a8f52becb2e50c52fdec685a579";
                   sha256 = "9cb4a4e554281246d29630b1fa3a0173e0d1c7de0b1f1c517f4ad3200d4a4c39";
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
