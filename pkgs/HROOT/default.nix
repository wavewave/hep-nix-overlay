{ mkDerivation, stdenv, ROOT, fficxx-runtime, HROOT-src-tree, HROOT-core, HROOT-hist, HROOT-graf, HROOT-math, HROOT-io, HROOT-tree }:

mkDerivation {
  pname = "HROOT";
  version = HROOT-src-tree.version;
  src = HROOT-src-tree+ "/HROOT/HROOT";
  #sourceRoot = "HROOT/HROOT";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ ROOT
                   fficxx-runtime
                   HROOT-core
                   HROOT-hist
                   HROOT-graf
                   HROOT-math
                   HROOT-io
                   HROOT-tree
                 ];
  doCheck = false;
  license = stdenv.lib.licenses.gpl3;
}
