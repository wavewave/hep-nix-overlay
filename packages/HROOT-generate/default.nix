{ cabal, fetchgit, HStringTemplate, fficxx, configurator, cmdargs }:

cabal.mkDerivation (self: {
  pname = "HROOT-generate";
  version = "0.8";
  src = fetchgit { url = "https://github.com/wavewave/HROOT-generate.git"; 
                   rev = "76079feddd56dd6186cef23071b73a7f295eb69b";
                   sha256 = "25f0dc00fc2cf6786ef061cd531187dc299040b3aa3f5616fc73da987cc14466";
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
