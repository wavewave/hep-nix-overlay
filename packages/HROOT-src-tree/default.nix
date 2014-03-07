{ stdenv, HROOT-generate }:

stdenv.mkDerivation rec { 
  name = "HROOT-src-tree-${version}.tar.gz";
  version = "0.8";
  src = [./HROOT-src.tar ];
  builder = ./build.sh;
  buildDepends = [ HROOT-generate ];
}