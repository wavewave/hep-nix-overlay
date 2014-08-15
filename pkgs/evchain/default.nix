{ cabal, gfortran, fetchgit, haskellPackages
, webdav-manager, HEPUtil, LHEParser, LHE-sanitizer
, conduit-util, madgraph-auto, pipeline-eventgen }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
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
