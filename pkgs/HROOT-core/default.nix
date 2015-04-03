{ cabal, ROOT, fficxx-runtime, HROOT-src-tree }:

cabal.mkDerivation (self: {
  pname = "HROOT-core";
  version = HROOT-src-tree.version;
  src = HROOT-src-tree;
  sourceRoot = "HROOT/HROOT-core";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ ROOT
                   fficxx-runtime
                 ];
  doCheck = false;
  meta = {
    homepage = "http://ianwookim.org/HROOT";
    description = "automatic HROOT binding generation";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
