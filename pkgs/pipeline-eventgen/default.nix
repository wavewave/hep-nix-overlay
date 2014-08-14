{ cabal, lib, gfortran, fetchgit, haskellPackages, webdav-manager, HEPUtil, LHEParser, madgraph-auto, madgraph-auto-model }:

with { hs = haskellPackages; };

cabal.mkDerivation (self: {
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
