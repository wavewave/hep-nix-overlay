{ fetchgit, haskell-ng }:

with { hs = haskell-ng; };

hs.cabal.mkDerivation (self: {
  pname = "hep-nix-overlay-tools";
  version = "0.0";
  src = fetchgit { url = "https://github.com/wavewave/hep-nix-overlay-tools.git"; 
                   rev = "2b85878eb31cdeda9384ca5b6e378303055d6afa";
                   sha256 = "d7d167f68821c0294f8a28f1c9aa5e7bf34338a7814d50c503a7f333d24cd1a3";
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
