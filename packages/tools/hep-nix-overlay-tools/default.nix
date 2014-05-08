{ fetchgit, haskellPackages }:

with { hs = haskellPackages; };

hs.cabal.mkDerivation (self: {
  pname = "hep-nix-overlay-tools";
  version = "0.0";
  src = fetchgit { url = "https://github.com/wavewave/hep-nix-overlay-tools.git"; 
                   rev = "4ee0e233a9131f1d5ba6df1310f9820dca908b33";
                   sha256 = "af1c44d15d719fd499c9baacc643540ec085bfeb399ed2d43fc005e0a74f67b1";
                 };  
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ hs.cmdargs
                   hs.split
                 ];
  doCheck = false;
  meta = {
  };
})
