{ mkDerivation, stdenv, fetchgit, haskellPackages, LHE-sanitizer, webdav-manager, devadmin 
, filepath, mtl, aeson, text, unordered-containers, transformers, HStringTemplate, hslogger, hashable }:

mkDerivation {
  pname = "madgraph-auto";
  version = "0.999";
  src = fetchgit { url = "https://github.com/wavewave/madgraph-auto.git"; 
                   rev = "5edea3c7cb63cb1bb8ba9fc76d5eff66e7ddd728";
                   sha256 = "293300489345d29b9be17fb1cab1b0b0cbbeee9c3c37467b4b95b80bad69257c";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ LHE-sanitizer
                   webdav-manager
                   devadmin
                   filepath
                   mtl
                   aeson
                   text
                   unordered-containers
                   transformers
                   HStringTemplate
                   hslogger
                   hashable 
                 ];
  doCheck = false;
  jailbreak = true; 
  license = stdenv.lib.licenses.gpl3;
}
