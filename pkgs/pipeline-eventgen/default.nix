{ mkDerivation, stdenv, gfortran, fetchgit, haskellPackages, webdav-manager, HEPUtil, LHEParser, madgraph-auto, madgraph-auto-model 
, cmdargs, mtl, filepath, aeson, unordered-containers, text, vector, attoparsec
, configurator, hslogger, random, aeson-pretty, base64-bytestring, RSA, crypto-api }:

mkDerivation {
  pname = "pipeline-eventgen";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/pipeline-eventgen.git"; 
                   rev = "f2f28e363031429cc15c0178db5f6c5bb5a3011d";
                   sha256 = "8cbeacb065270d2ee90da5080afb1df40851e7079ed83a12673bc637b1cb9dbc";
                 };  
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ webdav-manager
                   HEPUtil
                   LHEParser
                   madgraph-auto
                   madgraph-auto-model
                   gfortran
                   cmdargs
                   mtl
                   filepath
                   aeson
                   unordered-containers
                   text
                   vector
                   attoparsec
                   configurator
                   hslogger
                   random
                   aeson-pretty
                   base64-bytestring
                   RSA
                   crypto-api
                 ];
                  
  preBuild = ''
    export NIX_LDFLAGS="-L${stdenv.cc}/lib -L${stdenv.cc}/lib64 $NIX_LDFLAGS";
  '';
  doCheck = false;
  license = stdenv.lib.licenses.gpl3;
}
