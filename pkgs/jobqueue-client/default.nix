{ cabal, fetchgit, haskellPackages, jobqueue-server-src, jobqueue-common, madgraph-auto, madgraph-auto-model, pipeline-eventgen, webdav-manager }:

with haskellPackages;

cabal.mkDerivation (self: {
  pname = "jobqueue-client";
  version = "0.1.999";
  src = jobqueue-server-src;
 
  sourceRoot = "git-export/oldcode/jobqueue-client";

  isLibrary = true;
  isExecutable = true;
  buildDepends = [ acidState aeson attoparsec cereal httpConduit httpTypes mtl parsec safecopy text unorderedContainers vector

                   jobqueue-common madgraph-auto madgraph-auto-model pipeline-eventgen webdav-manager 
                 ];
  doCheck = true;

})
