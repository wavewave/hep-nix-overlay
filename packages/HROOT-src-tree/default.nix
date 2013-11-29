{ stdenv, HROOT-generate }:

stdenv.mkDerivation { 
  name = "HROOT-src-tree.tar.gz";
  src = [./HROOT-src.tar ];
  builder = ./build.sh;
  buildDepends = [ HROOT-generate ];
}