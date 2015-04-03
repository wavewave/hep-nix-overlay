{ cabal, ROOT, fficxx-runtime, HROOT-src-tree, HROOT-core, HROOT-hist }:

cabal.mkDerivation (self: {
  pname = "HROOT-graf";
  version = HROOT-src-tree.version;
  src = HROOT-src-tree;
  sourceRoot = "HROOT/HROOT-graf";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ ROOT
                   fficxx-runtime
                   HROOT-core
                   HROOT-hist
                 ];
  doCheck = false;
  meta = {
    homepage = "http://ianwookim.org/HROOT";
    description = "automatic HROOT binding generation";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
