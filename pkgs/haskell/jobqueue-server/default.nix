{ cabal, fetchgit, haskellPackages, jobqueue-server-src, jobqueue-common, madgraph-auto, madgraph-auto-model, pipeline-eventgen, webdav-manager }:

with haskellPackages;

cabal.mkDerivation (self: {
  pname = "jobqueue-server";
  version = "0.0";
  src = jobqueue-server-src;

        # fetchgit { url = "https://github.com/wavewave/jobqueue-server.git";
        #           rev = "e46c4431cdab69c6e090b1d7a56d36e652423585";
        #           sha256 = "b889f90ee4eb5f92698553d1b0ebdad8d12946717bf5d0adb893d81a038f0451"; 
        #         };
 
  sourceRoot = "git-export/oldcode/jobqueue-server";
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ acidState aeson attoparsec cereal mtl parsec safecopy text unorderedContainers vector wai waiExtra yesod yesodCore

                   jobqueue-common madgraph-auto madgraph-auto-model pipeline-eventgen webdav-manager 
                 ];
  doCheck = false;

})
