{ cabal, fetchgit, HStringTemplate, fficxx, configurator, cmdargs }:

cabal.mkDerivation (self: {
  pname = "HROOT-generate";
  version = "0.8.0";
  src = fetchgit { url = "https://github.com/wavewave/HROOT-generate.git"; 
                   rev = "2bb3db4c16ac3474e8f8ad945c2a9fe7586a54aa";
                   sha256 = "0752d4c2af2d1003a081de5687df7315a9a8f337afcc8e53414dfbe78372a25b";
                 };  
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ HStringTemplate
                   fficxx
                   configurator
                   cmdargs
                 ];
  doCheck = false;
  meta = {
    homepage = "http://ianwookim.org/HROOT";
    description = "automatic HROOT binding generation";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
