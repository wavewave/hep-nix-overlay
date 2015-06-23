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
                   rev = "17622a13db90dfe1c73f586765348af52498fd40";
                   sha256 = "f278fcad39e0f23c09237cd96e0b864523db4fa0ca0a303fe3fe462d4a483124";
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
