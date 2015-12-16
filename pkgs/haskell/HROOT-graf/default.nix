{ mkDerivation, stdenv, ROOT, fficxx-runtime, HROOT-src-tree, HROOT-core, HROOT-hist }:

mkDerivation {
  pname = "HROOT-graf";
  version = HROOT-src-tree.version;
  src = HROOT-src-tree + "/HROOT/HROOT-graf";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ ROOT
                   fficxx-runtime
                   HROOT-core
                   HROOT-hist
                 ];
  doCheck = false;
  license = stdenv.lib.licenses.gpl3;
}
