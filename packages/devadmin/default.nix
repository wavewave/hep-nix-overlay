{ cabal, fetchgit, haskellPackages, hepNixPackages }:

with { hs = haskellPackages; my = hepNixPackages; };

cabal.mkDerivation (self: {
  pname = "devadmin";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/devadmin.git"; 
                   rev = "8ab831b8cdfecb03d46bc10a478a0fab0b6c2d64";
                   sha256 = "3b520d0121d52610ab1868c55da88fd1611bcc3b7637625403096024283c8f64";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ hs.mtl
                   hs.filepath
                   # hs.unix
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
  meta = {
    homepage = "";
    description = "Full Orchestration of development environment";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
