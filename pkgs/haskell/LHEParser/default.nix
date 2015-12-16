{ mkDerivation, stdenv, fetchgit, gfortran, HEPUtil, conduit-util
, mtl, attoparsec, bytestring-lexing, text, xml-types, conduit, xml-conduit, transformers }:

mkDerivation {
  pname = "LHEParser";
  version = "0.999.0";
  src = fetchgit { url = "https://github.com/wavewave/LHEParser.git"; 
                   rev = "0d804bb6114eafd91f3bfe0830b0d29dd8af36e2";
                          # "f0d438e6313c2e43fd18c86847379e92e7887cf5";
                   sha256 = "d336a95654183e97b8341bc966b6a948b407fc7073e14d76ab8790d204c25a5d"; 
                          # "144b56ee69ff44d5ca77f43646ebdc33f0c6bf02aa7777385669628c0b3dbd81";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ HEPUtil
                   conduit-util
                   gfortran
                   mtl
                   attoparsec
                   bytestring-lexing
                   text
                   xml-types
                   conduit
                   xml-conduit
                   transformers
                 ];
  doCheck = false;
  license = stdenv.lib.licenses.bsd3;
}
