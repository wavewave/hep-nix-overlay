{ cabal, lib, gfortran, fetchgit, haskellPackages
, webdav-manager, HEPUtil, LHEParser, LHE-sanitizer
, conduit-util, madgraph-auto, pipeline-eventgen }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "evchain";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/evchain.git"; 
                   rev = "b0f9c3f4c29ef8fe7f4b0b5bf0ce055380a6fdc0";
                   sha256 = "3a47ce8e0de202746dc3e49c77721b6237ce3d41c232f8a1aad3df53e62fef7d";
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
