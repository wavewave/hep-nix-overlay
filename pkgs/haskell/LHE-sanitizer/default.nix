{ mkDerivation, stdenv, fetchgit, HEPUtil, conduit-util, LHEParser 
, mtl, transformers, conduit, xml-conduit, attoparsec, text, pureMD5, random, random-shuffle }:


mkDerivation {
  pname = "LHE-sanitizer";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/LHE-sanitizer.git"; 
                   rev = "b0a778d560b42255dbf0b4ed46168d864d322101";
                   sha256 = "aa361e90709b27d76fdcd80cbfaacd24f0b49721a2f737ed5e73005ba106cf72";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ HEPUtil
                   conduit-util
                   LHEParser
                   mtl
                   transformers
                   conduit
                   xml-conduit
                   attoparsec
                   text
                   pureMD5
                   random
                   random-shuffle
                 ];
  doCheck = false;
  license = stdenv.lib.licenses.gpl3;
}
