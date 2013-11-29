{ cabal, fficxx-runtime, HROOT-src-tree }:

cabal.mkDerivation (self: {
  pname = "HROOT-core";
  version = "0.8";
  src = HROOT-src-tree;
  sourceRoot = "HROOT/HROOT-core";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ fficxx-runtime
                   HROOT-src-tree
                 ];
  doCheck = false;
  meta = {
    homepage = "http://ianwookim.org/HROOT";
    description = "automatic HROOT binding generation";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
