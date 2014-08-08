{ cabal, lib, gfortran, fetchgit, haskellPackages, webdav-manager, HEPUtil, LHEParser, madgraph-auto, madgraph-auto-model }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "pipeline-eventgen";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/pipeline-eventgen.git"; 
                   rev = "d0e9215b95e823ea79e8e6d1e0a740cf535c55e8";
                   sha256 = "c22d29e11806c792f65a63c2491d20fdfa0f7ff3c57758fdd07efcd2e24be9e2";
                 };  
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ webdav-manager
                   HEPUtil
                   LHEParser
                   madgraph-auto
                   madgraph-auto-model
                   gfortran
                   hs.cmdargs
                   hs.mtl
                   hs.filepath
                   hs.aeson
                   hs.unorderedContainers
                   hs.text
                   hs.vector
                   hs.attoparsec
                   hs.configurator
                   hs.hslogger
                   hs.random
                   hs.aesonPretty
                   hs.base64Bytestring
                   hs.RSA
                   hs.cryptoApi
                 ];
                  
  #NIX_DEBUG=1;
  preBuild = ''
    export NIX_LDFLAGS="-L${gfortran.gcc}/lib -L${gfortran.gcc}/lib64 $NIX_LDFLAGS";
  '';
  doCheck = false;
  meta = {
    homepage = "http://github.com/hep-platform";
    description = "event generation executable in pipeline";
    license = self.stdenv.lib.licenses.gpl3;
    platforms = self.ghc.meta.platforms;
  };
})
