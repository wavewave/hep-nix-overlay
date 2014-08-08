{ cabal, fetchgit, haskellPackages }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "devadmin";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/devadmin.git"; 
                   rev = "850e0d1cc73bdc7242c100e38495b64ad97384a8";
                   sha256 = "480ec4eb360217b9809cb800e13e3c4093e50a6a3cb351631ac3cb99f279ed2e";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ hs.mtl
                   hs.filepath
                   hs.fgl
                   hs.time
                   hs.filemanip
                   hs.safe
                   hs.MissingH
                   hs.HStringTemplate
                   hs.parsec
                   hs.configurator
                   hs.cmdargs
                   hs.split
                   hs.strict
                   hs.text
                 ];
  doCheck = false;
  jailbreak = true;
  meta = {
    homepage = "";
    description = "Full Orchestration of development environment";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
