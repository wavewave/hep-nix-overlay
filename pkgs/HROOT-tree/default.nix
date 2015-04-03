{ cabal, ROOT, fficxx-runtime, HROOT-src-tree, HROOT-core }:

cabal.mkDerivation (self: {
  pname = "HROOT-tree";
  version = HROOT-src-tree.version;
  src = HROOT-src-tree;
  sourceRoot = "HROOT/HROOT-tree";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ ROOT
                   fficxx-runtime
                   HROOT-core
                 ];
  doCheck = false;
  meta = {
    homepage = "http://ianwookim.org/HROOT";
    description = "automatic HROOT binding generation";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
