{ mkDerivation, stdenv, gfortran, fetchgit, haskellPackages
, webdav-manager, HEPUtil, LHEParser, LHE-sanitizer
, conduit-util, madgraph-auto, pipeline-eventgen 
, mtl, filepath, transformers, cmdargs, xml-types
, conduit, vector, hmatrix, random, unordered-containers
, hashable, pureMD5, zlib, zlib-conduit
}:


mkDerivation {
  pname = "evchain";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/evchain.git"; 
                   rev = "3f2a7fd39f4d6c5f3229a9717dcb1c8bd1df59ef";
                   sha256 = "847c35f06a46801851e6af5f3fe9b54f758d6b7bc937284ae8f816537c48be84";
                 };  
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ webdav-manager
                   HEPUtil
                   LHEParser
                   LHE-sanitizer
                   conduit-util
                   madgraph-auto
                   pipeline-eventgen
                   mtl
                   filepath
                   transformers
                   cmdargs
                   xml-types
                   conduit
                   vector
                   hmatrix
                   random
                   unordered-containers
                   hashable
                   pureMD5
                   zlib
                   zlib-conduit
                 ];
                  
  doCheck = false;
  license = stdenv.lib.licenses.gpl3;
}
