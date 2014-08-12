{ cabal, fetchgit, haskellPackages, jobqueue-server-src, madgraph-auto, madgraph-auto-model, pipeline-eventgen, webdav-manager }:

with haskellPackages;

cabal.mkDerivation (self: {
  pname = "jobqueue-common";
  version = "0.0";
  src = jobqueue-server-src; 
  sourceRoot = "git-export/oldcode/jobqueue-common";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ acidState aeson attoparsec cereal mtl parsec safecopy text unorderedContainers vector

                   madgraph-auto madgraph-auto-model pipeline-eventgen webdav-manager
                 ];
  doCheck = false;

})
