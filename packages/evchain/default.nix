{ cabal, lib, gfortran, fetchgit, haskellPackages
, webdav-manager, HEPUtil, LHEParser, LHE-sanitizer
, conduit-util, madgraph-auto, pipeline-eventgen }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "evchain";
  version = "0.999";
  src = fetchgit { url = "https://github.com/hep-platform/evchain.git"; 
                   rev = "58ac84179954d6f2e8576d5671c36ef2c588b102";
                   sha256 = "12ee5f0cd86d0be070dd5824a68e018631e56fccd08fefe828dbbf8d6a5e2a05";
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
                   hs.mtl
                   hs.filepath
                   hs.transformers
                   hs.cmdargs
                   hs.xmlTypes
                   hs.conduit
                   hs.vector
                   hs.hmatrix
                   hs.random
                   hs.unorderedContainers
                   hs.hashable
                   hs.pureMD5
                   hs.zlib
                   hs.zlibConduit
                 ];
                  
  #NIX_DEBUG=1;
 #  preBuild = ''
 #   export NIX_LDFLAGS="-L${gfortran.gcc}/lib -L${gfortran.gcc}/lib64 $NIX_LDFLAGS";
 # '';
  doCheck = false;
  meta = {
    homepage = "http://github.com/hep-platform";
    description = "event chaining utility";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
