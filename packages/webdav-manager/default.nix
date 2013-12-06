{ cabal, fetchgit, haskellPackages, hepNixPackages }:

with { hs = haskellPackages; my = hepNixPackages; };

cabal.mkDerivation (self: {
  pname = "webdav-manager";
  version = "0.999";
  src = fetchgit { url = "https://github.com/hep-platform/webdav-manager.git"; 
                   rev = "2da2df30cdf3652682f5e965d8922770e68700bc";
                   sha256 = "81aa244ffd4f785852acc2ce8714f9466053ba44d104132baa5470e8c1e39c7b";
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
