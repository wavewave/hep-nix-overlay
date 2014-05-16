{ cabal, fetchgit }:

cabal.mkDerivation (self: {
  pname = "fficxx-runtime";
  version = "0.1.999";
  src = fetchgit { url = "https://github.com/wavewave/fficxx-runtime.git"; 
                   rev = "111e3d9c6a2173bdbd882e0e0b6b3ddab4826110";
                   sha256 = "e53f2e673a4effcb5de4e72050a193d1507f4c207a5f238bd0e14609e16d9f3d";
                 };  
  isLibrary = true;
  isExecutable = false;
  buildDepends = [ 
                
                 ];
  doCheck = false;
  meta = {
    homepage = "http://ianwookim.org/fficxx";
    description = "Runtime for fficxx-generated library";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
