{ cabal, lib, gfortran, fetchgit, haskellPackages, hepNixPackages }:

with { hs = haskellPackages; my = hepNixPackages; };

cabal.mkDerivation (self: {
  pname = "pipeline-eventgen";
  version = "0.999";
  src = fetchgit { url = "https://github.com/hep-platform/pipeline-eventgen.git"; 
                   rev = "8d839e82a3c0780eee97b953711075223244ef65";
                   sha256 = "b9bfd439a28cd2008d43341716f705a73cb9bcabd0330296abc2eb04d9ebc8f4";
                 };  
  isLibrary = true;
  isExecutable = true;
  buildDepends = [ my.webdav-manager
                   my.HEPUtil
                   my.LHEParser
                   my.madgraph-auto
                   my.madgraph-auto-model
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
