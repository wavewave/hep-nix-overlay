{ fetchgit, haskellPackages }:

with { hs = haskellPackages; };

hs.cabal.mkDerivation (self: {
  pname = "hep-nix-overlay-tools";
  version = "0.0";
  src = fetchgit { url = "https://github.com/wavewave/hep-nix-overlay-tools.git"; 
                   rev = "f169317668a19463f55e942a4aa3cde50615acd1";
                   sha256 = "edd04d3b942926d2d443fcd3426985ccc56b8d7d67c0eb139ee0254786d9dd1f";
                 };  
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ hs.cmdargs
                 ];
  doCheck = false;
  meta = {
  };
})
