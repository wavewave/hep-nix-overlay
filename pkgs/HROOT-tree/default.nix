{ mkDerivation, stdenv, ROOT, fficxx-runtime, HROOT-src-tree, HROOT-core }:

mkDerivation {
  pname = "HROOT-tree";
  version = HROOT-src-tree.version;
  src = HROOT-src-tree + "/HROOT/HROOT-tree";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ ROOT
                   fficxx-runtime
                   HROOT-core
                 ];
  doCheck = false;
  license = stdenv.lib.licenses.gpl3;
}
