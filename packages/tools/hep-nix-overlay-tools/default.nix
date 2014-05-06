{ fetchgit, haskellPackages }:

with { hs = haskellPackages; };

hs.cabal.mkDerivation (self: {
  pname = "hep-nix-overlay-tools";
  version = "0.0";
  src = fetchgit { url = "https://github.com/wavewave/hep-nix-overlay-tools.git"; 
                   rev = "7ef761629dc497bfccef1ae3100e649ed40f647e";
                   sha256 = "ec682eaa46fb1df88529edea053eca1dfa27930edfcfefa0a19e971027ac8c0c";
                 };  
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ hs.cmdargs
                 ];
  doCheck = false;
  meta = {
  };
})
