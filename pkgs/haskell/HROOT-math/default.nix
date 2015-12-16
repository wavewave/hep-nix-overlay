{ mkDerivation, stdenv, ROOT, fficxx-runtime, HROOT-src-tree, HROOT-core }:

mkDerivation {
  pname = "HROOT-math";
  version = HROOT-src-tree.version;
  src = HROOT-src-tree + "/HROOT/HROOT-math";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ ROOT  
                   fficxx-runtime
                   HROOT-core
                 ];
  doCheck = false;
  license = stdenv.lib.licenses.gpl3;
}
