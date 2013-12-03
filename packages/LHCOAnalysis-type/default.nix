{ cabal, fetchgit }:
#{ haskellPackages }:

#with import <haskellPackages> { }; 

cabal.mkDerivation (self: {
  pname = "LHCOAnalysis-type";
  version = "0.999";
  src = fetchgit { url = "https://github.com/hep-platform/LHCOAnalysis-type.git"; 
                   rev = "e6d29d10fe28bfd5e1091f30d09b8e5aaf3e3233";
                   sha256 = "18b39ceaf1260e07536f1fbc93d9c81003bbc121199130a2a5954f10a43c6813";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ ];
  doCheck = false;
  meta = {
    homepage = "";
    description = "LHCOAnalysis-type: LHC Olympics Type";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
