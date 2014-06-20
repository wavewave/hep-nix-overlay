{ cabal, fetchgit, HStringTemplate, fficxx, configurator, cmdargs }:

cabal.mkDerivation (self: {
  pname = "HROOT-generate";
  version = "0.8";
  src = fetchgit { url = "https://github.com/wavewave/HROOT-generate.git"; 
                   rev = "f4970e1a355f2fdae4268f7109e5a351ba594232";
                   sha256 = "095e75d7aa06da5531fd32c58b938d139120eeb1bdaf6a07694f9c06cc917b68";
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
