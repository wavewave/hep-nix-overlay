{ cabal, lib, gfortran, fetchgit, haskellPackages, webdav-manager, HEPUtil, LHEParser, madgraph-auto, madgraph-auto-model }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
  pname = "pipeline-eventgen";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/pipeline-eventgen.git"; 
                   rev = "2107baac8b44e0c17b57df157bf5666dcf163afc";
                   sha256 = "8bcf502573449c757bc71c2d0ef3b4663e3cbe2430c7cb97eb7e5a7f58e65b46";
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
