{ cabal, fetchgit, haskellPackages, jobqueue-common, madgraph-auto, madgraph-auto-model, pipeline-eventgen, webdav-manager }:

with haskellPackages;

cabal.mkDerivation (self: {
  pname = "jobqueue-server";
  version = "0.0";
  src = fetchgit { url = "https://github.com/wavewave/jobqueue-server.git";
                   rev = "36a7e27b4da54bff41b7cc5f8d23f7e69a2bcd0a";
                   sha256 = "9981cb66e7a64700f21ca3f4b277cdda3a293755d5b9f75ba14a38f18f9bcc88"; 
                 };
 
  sourceRoot = "git-export/oldcode/jobqueue-server";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ acidState aeson attoparsec cereal mtl parsec safecopy text unorderedContainers vector wai waiExtra yesod yesodCore

                   jobqueue-common madgraph-auto madgraph-auto-model pipeline-eventgen webdav-manager 
                 ];
  doCheck = false;

})
