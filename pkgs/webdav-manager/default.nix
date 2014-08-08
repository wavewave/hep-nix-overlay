{ cabal, fetchgit, haskellPackages }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "webdav-manager";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/webdav-manager.git"; 
                   rev = "4e8886b4a0c990b73377558a991f155f48be1184";
                   sha256 = "6aff40298641b25712a3043bf0c13f2cdc9d02d216ea7ab6c176527331936aad";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ hs.mtl
                   hs.filepath
                   hs.attoparsec
                 ];
  doCheck = false;
  meta = {
    homepage = "http://github.com/hep-platform";
    description = "webdav-manager: common routine for webdav server";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
