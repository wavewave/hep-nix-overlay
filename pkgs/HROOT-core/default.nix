{ mkDerivation, stdenv, ROOT, fficxx-runtime, HROOT-src-tree }:

mkDerivation {
  pname = "HROOT-core";
  version = HROOT-src-tree.version;
  src = HROOT-src-tree + "/HROOT/HROOT-core";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ ROOT fficxx-runtime ];
  doCheck = false;
  license = stdenv.lib.licenses.gpl3;
}
