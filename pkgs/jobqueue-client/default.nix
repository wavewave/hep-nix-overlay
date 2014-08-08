{ cabal, fetchgit, haskellPackages, jobqueue-common, madgraph-auto, madgraph-auto-model, pipeline-eventgen, webdav-manager }:

with haskellPackages;

cabal.mkDerivation (self: {
  pname = "jobqueue-client";
  version = "0.0";
  src = fetchgit { url = "https://github.com/wavewave/jobqueue-server.git";
                   rev = "d52dc8fde20364857ae50058c13d9d37e376039f";
                   sha256 = "eea317d72e807fe59938ca015c3a130a29fddadf2a131958a09acc114e718b51"; 
                 };
 
  sourceRoot = "git-export/oldcode/jobqueue-client";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ acidState aeson attoparsec cereal httpConduit httpTypes mtl parsec safecopy text unorderedContainers vector

                   jobqueue-common madgraph-auto madgraph-auto-model pipeline-eventgen webdav-manager 
                 ];
  doCheck = false;

})
