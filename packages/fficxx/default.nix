{ cabal, fetchgit, HStringTemplate, either, errors, lens, pureMD5, split }:

cabal.mkDerivation (self: {
  pname = "fficxx";
  version = "0.2";
  src = fetchgit { url = "https://github.com/wavewave/fficxx.git"; 
                   rev = "98b66ba803d03dbfe8c88d35dd1a86c888897ced";
                   sha256 = "1339f62b989bfb0f81345bd4078c0de66a174f59897991c862fb7d58c8ee13aa";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ HStringTemplate
                   either
                   errors
                   lens
                   pureMD5
                   split
                
                 ];
  doCheck = false;
  meta = {
    homepage = "http://ianwookim.org/fficxx";
    description = "automatic C++ binding generation";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
